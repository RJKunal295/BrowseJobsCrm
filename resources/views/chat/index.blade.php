@extends('layouts.app')

@section('title', 'Chat')

@section('content')

	@php
		// Deterministic color per person, so the same name always gets the
		// same initials-avatar color across the whole app.
		$avatarColors = ['#f56565', '#ed8936', '#ecc94b', '#48bb78', '#38b2ac', '#4299e1', '#667eea', '#9f7aea', '#ed64a6'];
		$colorFor = function (string $name) use ($avatarColors) {
			return $avatarColors[crc32($name) % count($avatarColors)];
		};
	@endphp

	<div class="d-flex align-items-center justify-content-between gap-2 mb-3 flex-wrap">
		<h4 class="mb-0">Chat</h4>
		<div class="d-flex gap-2">
			@if ($isMonitor)
				<a href="{{ route('chat.index', ['monitor' => $viewingAsMonitor ? 0 : 1]) }}" class="btn btn-outline-{{ $viewingAsMonitor ? 'primary' : 'danger' }}">
					<i class="ti ti-eye me-1"></i> {{ $viewingAsMonitor ? 'My Chats' : 'Monitor All Chats' }}
				</a>
			@endif
			<a href="{{ route('chat.group.create') }}" class="btn btn-outline-primary">
				<i class="ti ti-users-group me-1"></i> New Group
			</a>
			<div class="dropdown">
				<button class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
					<i class="ti ti-message-plus me-1"></i> New Chat
				</button>
				<div class="dropdown-menu dropdown-menu-end p-2" style="max-height: 300px; overflow-y: auto; min-width: 240px;">
					@foreach ($users as $u)
						<form method="POST" action="{{ route('chat.start', $u->id) }}">
							@csrf
							<button type="submit" class="dropdown-item d-flex align-items-center gap-2">
								@if ($u->profile_photo)
									<img src="{{ Storage::url($u->profile_photo) }}" class="rounded-circle" width="28" height="28" style="object-fit:cover;" alt="{{ $u->full_name }}">
								@else
									<span class="rounded-circle d-inline-flex align-items-center justify-content-center text-white fw-medium"
										style="width:28px;height:28px;font-size:12px;background-color:{{ $colorFor($u->full_name) }};">
										{{ strtoupper(substr($u->full_name, 0, 1)) }}
									</span>
								@endif
								{{ $u->full_name }}
							</button>
						</form>
					@endforeach
				</div>
			</div>
		</div>
	</div>

	@if ($viewingAsMonitor)
		<div class="alert alert-warning">
			<i class="ti ti-eye me-1"></i> You are viewing <strong>all employee conversations</strong> as a monitor. Messages you send here are disabled unless you're an actual participant.
		</div>
	@endif

	<div class="card" style="height: 75vh;">
		<div class="row g-0 h-100">
			<!-- Sidebar: conversation list -->
			<div class="col-md-4 border-end h-100 d-flex flex-column">
				<div class="p-2 border-bottom">
					<input type="text" id="chat-search" class="form-control form-control-sm" placeholder="Search conversations...">
				</div>
				<div id="chat-list" class="flex-grow-1 overflow-auto">
					@forelse ($conversations as $c)
						@php
							$name = $c->displayNameFor(auth()->user());
							$avatarUrl = $c->avatarUrlFor(auth()->user());
							$unread = $viewingAsMonitor ? 0 : $c->unreadCountFor(auth()->user());
						@endphp
						<a href="javascript:void(0);"
							class="chat-list-item d-flex align-items-start gap-2 p-3 border-bottom text-decoration-none text-dark"
							data-id="{{ $c->id }}" data-name="{{ $name }}">

							<div class="flex-shrink-0 chat-avatar">
								@if ($c->type === 'group')
									<span class="rounded-circle d-inline-flex align-items-center justify-content-center bg-secondary text-white"
										style="width:42px;height:42px;">
										<i class="ti ti-users-group"></i>
									</span>
								@elseif ($avatarUrl)
									<img src="{{ $avatarUrl }}" class="rounded-circle" width="42" height="42" style="object-fit:cover;" alt="{{ $name }}">
								@else
									<span class="rounded-circle d-inline-flex align-items-center justify-content-center text-white fw-medium"
										style="width:42px;height:42px;font-size:16px;background-color:{{ $colorFor($name) }};">
										{{ strtoupper(substr($name, 0, 1)) }}
									</span>
								@endif
							</div>

							<div class="flex-grow-1 min-width-0">
								<div class="d-flex justify-content-between align-items-start">
									<p class="mb-1 fw-medium text-truncate">{{ $name }}</p>
									<div class="fs-11 text-muted chat-last-time flex-shrink-0 ms-2">{{ $c->latestMessage?->created_at?->diffForHumans() }}</div>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<p class="mb-0 fs-13 text-muted text-truncate chat-last-message">
										{{ \Illuminate\Support\Str::limit($c->latestMessage?->body, 40) ?? 'No messages yet' }}
									</p>
									@if ($unread > 0)
										<span class="badge bg-danger rounded-pill chat-unread-badge flex-shrink-0 ms-2">{{ $unread }}</span>
									@endif
								</div>
							</div>
						</a>
					@empty
						<div class="p-3 text-center text-muted">No conversations yet. Start one above.</div>
					@endforelse
				</div>
			</div>

			<!-- Main pane: messages -->
			<div class="col-md-8 h-100 d-flex flex-column">
				<div id="chat-header" class="p-3 border-bottom d-none align-items-center gap-2">
					<div id="chat-header-avatar" class="flex-shrink-0"></div>
					<div>
						<h6 class="mb-0" id="chat-header-name"></h6>
						<p class="mb-0 fs-12 text-muted" id="chat-header-participants"></p>
					</div>
				</div>

				<div id="chat-placeholder" class="flex-grow-1 d-flex align-items-center justify-content-center text-muted">
					<div class="text-center">
						<i class="ti ti-message-2 fs-48 d-block mb-2"></i>
						Select a conversation to start chatting
					</div>
				</div>

				<div id="chat-messages" class="flex-grow-1 overflow-auto p-3 d-none"></div>

				<div id="chat-input-area" class="p-2 border-top d-none">
					<form id="chat-send-form" class="d-flex gap-2">
						<input type="text" id="chat-message-input" class="form-control" placeholder="Type a message..." autocomplete="off">
						<button type="submit" class="btn btn-primary"><i class="ti ti-send"></i></button>
					</form>
				</div>

				<div id="chat-readonly-notice" class="p-2 border-top text-center text-muted fs-13 d-none">
					<i class="ti ti-lock me-1"></i> You're viewing this as a monitor — you can't send messages here.
				</div>
			</div>
		</div>
	</div>

@endsection

@push('scripts')
	<script>
		(function () {
			const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
			const viewingAsMonitor = {{ $viewingAsMonitor ? 'true' : 'false' }};
			let activeConversationId = {{ $activeConversationId ? (int) $activeConversationId : 'null' }};
			let lastMessageId = 0;
			let isParticipantOfActive = false;

			const avatarColors = ['#f56565', '#ed8936', '#ecc94b', '#48bb78', '#38b2ac', '#4299e1', '#667eea', '#9f7aea', '#ed64a6'];

			function hashCode(str) {
				let hash = 0;
				for (let i = 0; i < str.length; i++) {
					hash = str.charCodeAt(i) + ((hash << 5) - hash);
				}
				return Math.abs(hash);
			}

			function colorFor(name) {
				return avatarColors[hashCode(name) % avatarColors.length];
			}

			function avatarHtml(name, avatarUrl, type, size) {
				size = size || 40;
				if (type === 'group') {
					return `<span class="rounded-circle d-inline-flex align-items-center justify-content-center bg-secondary text-white" style="width:${size}px;height:${size}px;"><i class="ti ti-users-group"></i></span>`;
				}
				if (avatarUrl) {
					return `<img src="${avatarUrl}" class="rounded-circle" width="${size}" height="${size}" style="object-fit:cover;" alt="${name}">`;
				}
				const initial = name ? name.charAt(0).toUpperCase() : '?';
				const fontSize = Math.round(size * 0.4);
				return `<span class="rounded-circle d-inline-flex align-items-center justify-content-center text-white fw-medium" style="width:${size}px;height:${size}px;font-size:${fontSize}px;background-color:${colorFor(name)};">${initial}</span>`;
			}

			const chatList = document.getElementById('chat-list');
			const chatMessages = document.getElementById('chat-messages');
			const chatPlaceholder = document.getElementById('chat-placeholder');
			const chatHeader = document.getElementById('chat-header');
			const chatHeaderAvatar = document.getElementById('chat-header-avatar');
			const chatHeaderName = document.getElementById('chat-header-name');
			const chatHeaderParticipants = document.getElementById('chat-header-participants');
			const chatInputArea = document.getElementById('chat-input-area');
			const chatReadonlyNotice = document.getElementById('chat-readonly-notice');
			const sendForm = document.getElementById('chat-send-form');
			const messageInput = document.getElementById('chat-message-input');

			function escapeHtml(str) {
				const div = document.createElement('div');
				div.textContent = str;
				return div.innerHTML;
			}

			function renderMessage(m) {
				const alignClass = m.is_mine ? 'justify-content-end' : 'justify-content-start';
				const bubbleClass = m.is_mine ? 'bg-primary text-white' : 'bg-light';
				const senderLabel = m.is_mine ? '' : `<div class="fs-11 fw-medium mb-1">${escapeHtml(m.sender_name)}</div>`;

				return `
					<div class="d-flex ${alignClass} mb-2">
						<div class="p-2 rounded ${bubbleClass}" style="max-width: 70%;">
							${senderLabel}
							<div>${escapeHtml(m.body)}</div>
							<div class="fs-10 text-end mt-1 ${m.is_mine ? 'text-white-50' : 'text-muted'}">${m.time}</div>
						</div>
					</div>`;
			}

			function scrollToBottom() {
				chatMessages.scrollTop = chatMessages.scrollHeight;
			}

			function openConversation(id) {
				activeConversationId = id;
				lastMessageId = 0;

				fetch(`/chat/${id}${viewingAsMonitor ? '?monitor=1' : ''}`)
					.then(res => res.json())
					.then(data => {
						chatPlaceholder.classList.add('d-none');
						chatHeader.classList.remove('d-none');
						chatHeader.classList.add('d-flex');
						chatMessages.classList.remove('d-none');

						chatHeaderAvatar.innerHTML = avatarHtml(data.conversation.name, data.conversation.avatar, data.conversation.type, 42);
						chatHeaderName.textContent = data.conversation.name;
						chatHeaderParticipants.textContent = data.conversation.participants.join(', ');

						isParticipantOfActive = data.conversation.is_participant;
						if (isParticipantOfActive) {
							chatInputArea.classList.remove('d-none');
							chatReadonlyNotice.classList.add('d-none');
						} else {
							chatInputArea.classList.add('d-none');
							chatReadonlyNotice.classList.remove('d-none');
						}

						chatMessages.innerHTML = data.messages.map(renderMessage).join('');
						if (data.messages.length) {
							lastMessageId = data.messages[data.messages.length - 1].id;
						}
						scrollToBottom();

						document.querySelectorAll('.chat-list-item').forEach(el => el.classList.remove('bg-light'));
						const activeEl = document.querySelector(`.chat-list-item[data-id="${id}"]`);
						if (activeEl) activeEl.classList.add('bg-light');

						const url = new URL(window.location);
						url.searchParams.set('conversation', id);
						window.history.replaceState({}, '', url);
					});
			}

			chatList.addEventListener('click', function (e) {
				const item = e.target.closest('.chat-list-item');
				if (!item) return;
				openConversation(item.dataset.id);
			});

			sendForm.addEventListener('submit', function (e) {
				e.preventDefault();
				const body = messageInput.value.trim();
				if (!body || !activeConversationId) return;

				fetch(`/chat/${activeConversationId}/messages`, {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json',
						'X-CSRF-TOKEN': csrfToken,
					},
					body: JSON.stringify({ body }),
				})
					.then(res => res.json())
					.then(message => {
						chatMessages.insertAdjacentHTML('beforeend', renderMessage(message));
						lastMessageId = message.id;
						scrollToBottom();
						messageInput.value = '';
					});
			});

			// Poll the OPEN conversation for new messages every 4s.
			setInterval(function () {
				if (!activeConversationId) return;

				fetch(`/chat/${activeConversationId}/messages/poll?after_id=${lastMessageId}${viewingAsMonitor ? '&monitor=1' : ''}`)
					.then(res => res.json())
					.then(data => {
						if (data.messages.length) {
							data.messages.forEach(m => {
								chatMessages.insertAdjacentHTML('beforeend', renderMessage(m));
							});
							lastMessageId = data.messages[data.messages.length - 1].id;
							scrollToBottom();
						}
					});
			}, 4000);

			// Refresh the sidebar (previews + unread badges) every 10s.
			setInterval(function () {
				fetch(`{{ route('chat.list-poll') }}${viewingAsMonitor ? '?monitor=1' : ''}`)
					.then(res => res.json())
					.then(data => {
						data.conversations.forEach(c => {
							const el = document.querySelector(`.chat-list-item[data-id="${c.id}"]`);
							if (!el) return;
							el.querySelector('.chat-last-message').textContent = c.last_message ? c.last_message.slice(0, 40) : 'No messages yet';
							el.querySelector('.chat-last-time').textContent = c.last_message_at || '';

							const avatarEl = el.querySelector('.chat-avatar');
							if (avatarEl) {
								avatarEl.innerHTML = avatarHtml(c.name, c.avatar, c.type, 42);
							}

							let badge = el.querySelector('.chat-unread-badge');
							if (c.unread > 0) {
								if (!badge) {
									badge = document.createElement('span');
									badge.className = 'badge bg-danger rounded-pill chat-unread-badge flex-shrink-0 ms-2';
									el.querySelector('.d-flex.justify-content-between.align-items-center').appendChild(badge);
								}
								badge.textContent = c.unread;
							} else if (badge) {
								badge.remove();
							}
						});
					});
			}, 10000);

			// Auto-open a conversation if one was passed via ?conversation=ID
			// (e.g. right after starting a new chat or creating a group).
			if (activeConversationId) {
				openConversation(activeConversationId);
			}
		})();
	</script>
@endpush