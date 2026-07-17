// public/service-worker.js
// This runs in the background, separate from your page — it's what lets
// notifications show up even if the browser tab is closed.

// Take over immediately when this file changes. Without this, an updated
// worker sits in "waiting" until every app tab is closed, so users who keep
// a tab open forever would run stale code indefinitely.
self.addEventListener('install', function () {
	self.skipWaiting();
});
self.addEventListener('activate', function (event) {
	event.waitUntil(self.clients.claim());
});

self.addEventListener('push', function (event) {
	let payload = {};
	try {
		payload = event.data ? event.data.json() : {};
	} catch (e) {
		payload = { title: 'BrowseJobs', body: event.data ? event.data.text() : '' };
	}

	const title = payload.title || 'BrowseJobs';
	const options = {
		body: payload.body || '',
		icon: payload.icon || '/build/assets/img/logo-small.svg',
		badge: payload.badge || '/build/assets/img/logo-small.svg',
		data: payload.data || {},
		actions: payload.actions || [],
		// Buzz + play the notification sound; keep it visible until acted on.
		vibrate: payload.vibrate || [200, 100, 200],
		requireInteraction: payload.requireInteraction || false,
		// Unique fallback tag — a reused tag silently REPLACES a notification
		// still in the tray instead of showing a new banner.
		tag: payload.tag || 'browsejobs-' + Date.now(),
		silent: false,
	};

	event.waitUntil((async () => {
		try {
			await self.registration.showNotification(title, options);
		} catch (e) {
			// An option this browser rejects must never cost us the banner.
			await self.registration.showNotification(title, { body: options.body });
		}

		// Ask any open app tab to play the in-page chime too. Best-effort.
		try {
			const clientsList = await self.clients.matchAll({ type: 'window', includeUncontrolled: true });
			clientsList.forEach((c) => c.postMessage({ type: 'play-notification-sound' }));
		} catch (e) { /* sound only — never block the notification */ }
	})());
});

// When the user clicks the notification, focus an open app tab (navigating
// it to the target page) or open a new one.
self.addEventListener('notificationclick', function (event) {
	event.notification.close();

	const url = (event.notification.data && event.notification.data.url) || '/';

	event.waitUntil((async () => {
		const windowClients = await self.clients.matchAll({ type: 'window', includeUncontrolled: true });

		for (const client of windowClients) {
			if ('focus' in client) {
				await client.focus();
				if (client.url !== url && 'navigate' in client) {
					try { await client.navigate(url); } catch (e) { /* keep the focused tab */ }
				}
				return;
			}
		}

		if (self.clients.openWindow) {
			await self.clients.openWindow(url);
		}
	})());
});
