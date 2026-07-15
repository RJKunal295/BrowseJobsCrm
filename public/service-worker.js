// public/service-worker.js
// This runs in the background, separate from your page — it's what lets
// notifications show up even if the browser tab is closed.

self.addEventListener('push', function (event) {
	if (!event.data) return;

	const payload = event.data.json();

	const options = {
		body: payload.body,
		icon: payload.icon || '/build/assets/img/logo-small.svg',
		badge: payload.badge || '/build/assets/img/logo-small.svg',
		data: payload.data || {},
		actions: payload.actions || [],
	};

	event.waitUntil(
		self.registration.showNotification(payload.title, options)
	);
});

// When the user clicks the notification, open (or focus) the relevant page.
self.addEventListener('notificationclick', function (event) {
	event.notification.close();

	const url = (event.notification.data && event.notification.data.url) || '/';

	event.waitUntil(
		clients.matchAll({ type: 'window', includeUncontrolled: true }).then(function (windowClients) {
			for (const client of windowClients) {
				if (client.url === url && 'focus' in client) {
					return client.focus();
				}
			}
			if (clients.openWindow) {
				return clients.openWindow(url);
			}
		})
	);
});