'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "8a5acca649b602d480173fd37a8b272f",
"assets/assets/2.gif": "8456dc325997d7548b50304a7d718a34",
"assets/assets/3.gif": "edeb8665b9df2b944d61244173b0d710",
"assets/assets/4.gif": "1e3dc7e1740e24c380e24db911dca359",
"assets/assets/4.MP4": "3b643dace7cb84216c83a5eca7d604c4",
"assets/assets/5.gif": "8b35e5abb77fcfb36cb75fdd8308e59e",
"assets/assets/athome.jpg": "41e17794ead3618b6ea1786364a1a092",
"assets/assets/avatar.jpg": "14c0dec8611380778e4172f512534ff3",
"assets/assets/b.gif": "4daaf566b3fd188b2475c4a1809440b0",
"assets/assets/braid.png": "30a763fb3ceaf97693a875ebd4935ed1",
"assets/assets/c4.png": "5576617da8d2774a9244c406c640ca84",
"assets/assets/calendar.png": "d585b6e855185a9e862151a62efedf1b",
"assets/assets/card.png": "4b2d168c29fd87b05b41014e876a5130",
"assets/assets/carousel/homeC%2520(1).jpg": "b17dd8b0ce538b3ce0d77ff52e753132",
"assets/assets/carousel/homeC%2520(2).jpg": "753e32b3a9f9921767d4db88f694b6fd",
"assets/assets/carousel/homeC%2520(3).jpg": "14965f0d575c685f43e89fbdd1abbabf",
"assets/assets/carousel/homeC%2520(4).jpg": "98e50cf409cb440c76ff2e9f3a04ca90",
"assets/assets/cosmetics.png": "fb449553ca83471ff471e53e07d7a9cd",
"assets/assets/counter.png": "5e81d54b53807f57f506760e7ca2717f",
"assets/assets/edu.png": "9b4d1bbe4231b14332cdc3b42d5c0c6c",
"assets/assets/education.png": "b37364aafe186b96bca08fce586c892c",
"assets/assets/elieLogo.png": "c274349bea34200cfe03e0775a808dc9",
"assets/assets/events.png": "1fd324c14a7b21b51f4dbc00d510c95f",
"assets/assets/fit.png": "f35a306b9d427a0f62a249132261dd65",
"assets/assets/fitness.png": "2197febef923adc5fa6b51aeab198350",
"assets/assets/foot.jpg": "4ec636ac5e2ea4dee4b6a71301d6d1f5",
"assets/assets/foot2.jpg": "5fca527b0e223eeeb43d55d5392d83b1",
"assets/assets/growth-career.png": "788cf280bb630c85984f20eccace536c",
"assets/assets/hairdresser.png": "b7f5d1cf3f53d779c97bc6daeac32583",
"assets/assets/happycustomers.jpg": "f8a368084659b7b5cf0d45b784c5d6f2",
"assets/assets/home.jpg": "3ca9609aa387738529ab3719c91eb60b",
"assets/assets/homeHero.png": "bfc40ad31c44fb8ec9a8a53641734e5f",
"assets/assets/l1.png": "ae06f6dc73a9614308456d84fe7c9df4",
"assets/assets/l2.png": "3a5dcad9eafd94c7351a6828cb13f868",
"assets/assets/l3.png": "6d0b2b16327f23fe580dcd4877604ab2",
"assets/assets/l4.png": "f0de6fb7b5d834c1c656aa383a2ad1dd",
"assets/assets/lady1.png": "30a7ec37868ea01cc28424893487bbbd",
"assets/assets/lady2.png": "ac2e8b05ed99d7f05a5956e33ca0ffc4",
"assets/assets/lady3.png": "1ca4184075b2f955a1e59b46b27352f1",
"assets/assets/launcher.jpg": "2c315600858134d8902b3d44cfc8344b",
"assets/assets/launcher.png": "b2683aaa2603d22730639b631990b229",
"assets/assets/logo.jpg": "32a96f265653f3f354af307eb51b4ee4",
"assets/assets/logout.png": "62ded726f684803d327b1ee87f512daa",
"assets/assets/moon.png": "71137650ab728a466a50fa4fa78fb2b9",
"assets/assets/parallax.jpg": "02d8deede0fac416a41ed80784cfb3ef",
"assets/assets/product1.png": "95f9a58e71196c41f13bf74207cd39bc",
"assets/assets/product2.png": "b41a93c38e9f49a643462fb2a1216102",
"assets/assets/productHero.jpg": "57257ca410a362c35fa394128f606a8f",
"assets/assets/review.png": "b96edca52f8cb4326b9c8a94636018bb",
"assets/assets/salon-chair.png": "49ec3912f6adc7c9ef6311e7f30b48dd",
"assets/assets/saloni.png": "70654a247b112c5e0bedba6161175a75",
"assets/assets/serviceHero.jpg": "e24d6bbbaba250bd308dfde567ea2d96",
"assets/assets/shopping-bag.png": "b12f1c85a7cde52149083275baa5fa32",
"assets/assets/spai.png": "e2929271436a6e1cb099b17d0140a505",
"assets/assets/success.mp3": "5afa2abe9f1a796c228c42293c910f76",
"assets/assets/sun.png": "5fd1657bcb73ce5faafde4183b3dab22",
"assets/assets/tattoo.png": "5385390add73b108be71b7077f75abb3",
"assets/assets/testimonial.png": "696c8423acd55232cf8622795c12d57a",
"assets/assets/testimonialImg.png": "5ce009ac22c652445ce3adcc846d7097",
"assets/assets/therapy.png": "635e5ae0e1104ce6010e627cacff0f36",
"assets/assets/ttt.png": "cbefd705a452644b3f22eaba809c3469",
"assets/FontManifest.json": "9bc986d60e9cc6385d686016c8e2d190",
"assets/fonts/heading.otf": "1f55925e52b9e71fd57108874184060d",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/fonts/NeutraTextTF-Book.otf": "9f5cbd54960a1e8784efe6235ab6762a",
"assets/fonts/p1.ttf": "cc84650569fd07dac022c55b20c66e46",
"assets/fonts/p2.ttf": "98d2f97305ab25d4511982e73740922e",
"assets/fonts/quotes.ttf": "cface0525a4b4cfead1ca69a12f5e839",
"assets/fonts/SFNSDisplay-Ultralight.otf": "734b5cc7c72aa6a9bf42c77cbfac4b6a",
"assets/images/1star.png": "8fefb866409a7dd772ecbf144e1e47f1",
"assets/images/2star.png": "18dfae09597d9b9e6fcac2a6c179e121",
"assets/images/3star.png": "906fa1b02d4009acb71fc22668bea92d",
"assets/images/4star.png": "dcc4b7fd29ac8ad115a2f2fdb0a45fa0",
"assets/images/5star.png": "1e9013ac0d39eff45bff8bec112cbdfa",
"assets/images/apple.png": "b68406e85c4276ab6028d342c2e1bd0c",
"assets/images/apple1.png": "77ca8b6daef7f3a2c81f8266a17cd96a",
"assets/images/footers.png": "e3e1fe9bf0c1d73af6ae6cc614549f77",
"assets/images/google.png": "858326605ef1adb7f91f51bf978423c4",
"assets/images/Intersect.png": "5b8534335b5abb892b0f1f4ae48091ae",
"assets/images/mascot.jpg": "4c591292cb88a6e2b0178c17bee7d266",
"assets/images/salon.svg": "e97c61347577512f63032718cf32cef1",
"assets/images/spa.svg": "995b3f537b631462b75574f5372257ab",
"assets/images/star.png": "88d52751066d4879496ac525305d5051",
"assets/NOTICES": "2e055fda6905e7378acc294b35570ec7",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "c274349bea34200cfe03e0775a808dc9",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"index.html": "9aaae67525bb90273f627ceac1192006",
"/": "9aaae67525bb90273f627ceac1192006",
"main.dart.js": "ac7e182f5c0c9177972428a3a6aa364e",
"manifest.json": "fbdf04a597dd3dcb38ce98c382a1c3a4",
"version.json": "9b30176b07b28af75626fd574ce26ff3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
