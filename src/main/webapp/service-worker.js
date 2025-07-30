const CACHE_NAME = "yumgo-cache-v1";
const FILES_TO_CACHE = [
  "/",
  "/index.jsp",
  "/offline.html",
  "/resources/css/style.css",
  "/resources/js/app.js",
  "/resources/icons/icon-192.png",
  "/resources/icons/icon-512.png"
];

// ✅ Service Worker 설치 단계 – 캐시 저장
self.addEventListener("install", (event) => {
  console.log("[ServiceWorker] Install");
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      console.log("[ServiceWorker] Pre-caching offline page");
      return cache.addAll(FILES_TO_CACHE);
    })
  );
  self.skipWaiting();
});

// ✅ 활성화 단계 – 오래된 캐시 제거
self.addEventListener("activate", (event) => {
  console.log("[ServiceWorker] Activate");
  event.waitUntil(
    caches.keys().then((keyList) =>
      Promise.all(
        keyList.map((key) => {
          if (key !== CACHE_NAME) {
            console.log("[ServiceWorker] Removing old cache", key);
            return caches.delete(key);
          }
        })
      )
    )
  );
  self.clients.claim();
});

// ✅ 요청 가로채기 – 캐시 or 네트워크
self.addEventListener("fetch", (event) => {
  console.log("[ServiceWorker] Fetch", event.request.url);
  event.respondWith(
    fetch(event.request).catch(() => {
      return caches.match(event.request).then((response) => {
        return response || caches.match("/offline.html");
      });
    })
  );
});
