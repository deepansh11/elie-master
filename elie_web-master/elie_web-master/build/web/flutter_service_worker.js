'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "0a1f21a3417389e0c0a13392c79a7a89",
".git/config": "7437e039c26c1c285cb1599503480d8c",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "37919e21831da87db7e4d7a8a822bd59",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "8a961cc35362326ba68c914857fcc5d1",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "63097fd25077b312338449acb96a0897",
".git/logs/refs/heads/master": "63097fd25077b312338449acb96a0897",
".git/logs/refs/remotes/origin/master": "8b698863b5b1a0bc4a5ac64ecf3ca897",
".git/objects/00/22caa94d4f6922d5ed8c37a877e731d05e5fcc": "3c89ce6554ae8235101752c9873296d7",
".git/objects/02/bb649b1bc1346bb423cb3aa144af0907780c1d": "06a05d9ba243c48576fced5eb99bdf89",
".git/objects/05/982977cfdd2d031978b84a36adb8d9e3132706": "f8bd6cf270f86f61e21f5c9681cdcc9a",
".git/objects/0b/34134a7fba8bfaf87fc5866ae29f9b5e27cc45": "d6656dca82771ecbd45e35a2f63ec7df",
".git/objects/0d/0df08f7c3e147a8ae36017cf81a96e35b73717": "106e868f28a72727fb6fb0fa71123633",
".git/objects/11/8ec3fa0c3e7632063ee80bb4438521deeb1b3b": "e70779437271c61c131114636a8643f0",
".git/objects/11/ebe0abf0e894a859e0fb58e7eae195cda45183": "a448adc1da0456db701dc50d773d932a",
".git/objects/12/19b5de37166aff5a84418f57c01e426cbe8d08": "94aeb7a927fc530d20ebc1f9750bed74",
".git/objects/14/59f4f4f5f3e0c1a0f78772ad72cb38815adc91": "edbe050c2e9c510bcd91a1c10a752abf",
".git/objects/15/805f9f17364d020880e2a6736ab6353646c749": "640973db8aff1626120b4c06cf1d96ca",
".git/objects/16/bd791429ccb3077742ca5b7354ad98a0bc2fa7": "c76bfde8b9b82540c839a489ec8e3380",
".git/objects/18/aeb2ae7468b5f9edae0ff7da45efd522a6d4d0": "e159707edd8c161661ab8e6c9276a05a",
".git/objects/19/6ec5476ea56b27322040be406251a79f93c902": "5398c70dfb152f8ab20ac9b1a2299904",
".git/objects/1c/daede23d894be182725c012546c53ae6b74557": "b3997767a81ed8ba590f215867a90dc7",
".git/objects/1f/9dea86d49da71f095111707d03b9140eb69733": "0bd4fa0f40267bf0e6d88529e788d60b",
".git/objects/20/0bf5184fd3c584c604c105d9ef8209b8926565": "4c7c7111064b0ec391cd2aeea805492d",
".git/objects/20/9052e8560187aa3ad9e48689acb0832415c05f": "f569e6fda1d771eac84efe166ca19a67",
".git/objects/22/0b101c1c43ec4b033a36fc510cdfcaf3bf2251": "31bb4c4be808bd22c286eb8bced20b5a",
".git/objects/22/bef9cf601b623421031f33c4165b91fa4e7342": "3b3d0ad084f9591f2abfaf7b4e5e2cf6",
".git/objects/24/b1f14dd348b07c9b8373758bde9ac14d16fd92": "dbf45d6c044044561758a334420e9569",
".git/objects/25/ff4bb8e13dbca18873abc8dc12d5e5c3edebe8": "585c9c42a0267a30e5f89427e9bf4e73",
".git/objects/26/ac9c49c1725f590f62eff879adebcf76745493": "6bb95bd6407ce3811c3296b38eb63caa",
".git/objects/28/2e85e54a9d6291535f42ffe9eccf737ed47d4b": "534b3ee66c878c66edfaeb8c12dce3b3",
".git/objects/28/abc991f543724d7300e8e86939b3eb9da91cde": "7e75612a72fb11a9b08d198ab40dbd67",
".git/objects/29/2214367c0af9a2eee8f873b2944224e2fe3f0c": "902d6cf3d5ea70392a74bfc9ded583bb",
".git/objects/29/91fdbaa60a05df750f30daa6d8ad51b67484c8": "93d93f66b92f121278b23fd7f5f7639a",
".git/objects/2a/94b4646ddb7e468764f3b4adb982ad867fea16": "aaaaa7f521ea04596ddafecfc7ee78e0",
".git/objects/2c/547f0485445fe4d048d2686d28010489fcd8b1": "6a801453989ba86351ffa92a3dc7ccaf",
".git/objects/2d/0471ef9f12c9641643e7de6ebf25c440812b41": "d92fd35a211d5e9c566342a07818e99e",
".git/objects/2d/cf3542c874e33cd8ab86ceb6f0ec444228aa78": "66baad0ae5d874f09b6eee790095bc65",
".git/objects/34/6ef8c8bf7e735ad014abc9bc92c9d7ddc9d55a": "8c6e73679674ecd2062557712cee0d2c",
".git/objects/37/55a1f9e9b241621f2a8f094f2714d8b0f574b0": "143748d46d67de9d58ab245eba296689",
".git/objects/39/b9777a3aa154e64b531bbc3a629e5c6f88aa24": "f539bbce3060911fb8f30c683919a482",
".git/objects/3c/b3b53a24ee4712b8463133dca203ddd72fb43b": "c3066eae2c84f5465b93f0624f5ecfa6",
".git/objects/3c/eee28d908f250749740981b88ad577f0ea243f": "a06013fad567392ebe0827ae4919cca1",
".git/objects/3f/b654f1566b2e20ee7eb5639874513ebc293600": "40fa51c4cd97b4189e4db4005e95ed3e",
".git/objects/40/5253cef5ed302d9e298572786fc05e42ae0be4": "258761bffd9a7e28301e0f05b83161c3",
".git/objects/44/722f63d15445d15fea33ee096ae2e64313a71a": "a703fdc24ea89323b0d1e6068bf74128",
".git/objects/45/59cea21e53c9531d8486aba352e723647d060c": "08df870fc62823d763173ec56d3cd998",
".git/objects/48/66971ab99ddaed608448e28898c2e5ddb1657f": "c8cedf26185886d6b603ab1f4ce371a9",
".git/objects/4b/bc7a2f845a23bf1d067e148f7f3c80ba5c9491": "edb42fe38721751e991ea049ab1fbdef",
".git/objects/4e/28dadc6834411dbb1a494c0aa366154c1ecacd": "f033aa6f30f353010df3976588d30adf",
".git/objects/4e/89617a3696bd10c155ec378f4a65a9f89e9e3a": "d8056e20bae90d092b619c895129e982",
".git/objects/4f/3de3de3fddecd8c4908aa52ac3085ce655f19f": "760d9243c4b5ee0eae788ac37db4b39e",
".git/objects/51/eff3df9fa36a18b4d138e4f7e4089bffd8a564": "48a724ae9507f5cff5c904783011a500",
".git/objects/52/1b89a7768ca5d5c1daff69ba000abdf947dbb1": "016f1e60ae6fab0f385f5fbd79adb666",
".git/objects/54/f2aa8db672c097fc84be94a91ebee059a8143e": "ad99a72fdd53d33c2ab8ad85bf343e75",
".git/objects/56/6182b121fe30e5357e0acd95d6b6c9a860980c": "7b7e7bf497874386a9d5f6c71b49f3fa",
".git/objects/58/6765dd1b2351a5d3baa57bb358f92b00f79f30": "17c4b833140790c28414024b8c755494",
".git/objects/59/6d73b2056daf8d73fe36c5844ffd50a21eeda2": "69d80f6e2f32e218d98b5238e9a3bbd8",
".git/objects/61/f6bd7cb86485f47de52319cf16db9f19189ac8": "4de4caac88340123e99755071ffae6ad",
".git/objects/62/0d0a61449417fca4b18ba51b98edf605ff4ddb": "3e63ebff786bdcc8e3211fc258235835",
".git/objects/64/b92c25d504646dac1a520d4308abeee5812fc7": "cabf6427bd60ccd8b259adb1dacce96f",
".git/objects/65/5a67d9c5e964624e3b5526d39946d1b07ae4e5": "b8f1515e2112f14a4e3adfa02f377bc7",
".git/objects/6b/2abd86266ad1089182abce17c92461f0363107": "25f7d9a1dbd555f141ff166d6c0010c6",
".git/objects/72/1f9d7713bb12435af658b98ec0917a13ea2891": "4d374694625f630af8ab77e123f88ef9",
".git/objects/73/b3cf73dbd804882466aaaa574fe334e0425405": "03bca42b77a98be432dc59f4ad45ce99",
".git/objects/74/592ec85c0a7cf12c516f30a522bc59b37a5938": "e0651060f54dffe2d7bef59b974761c5",
".git/objects/75/b4517eb611c1311962ecc46b9e61fd498e2473": "5a6c9c1f2a8e9e6cf4bc3ba3587b9506",
".git/objects/76/8651b2e249c2517c7b37bdbeea0a5d8bfbb707": "495b1c4fefa633f6afe4dc5840ebe18f",
".git/objects/77/1148245f6b62a19e28a666e0301216b58f2f9d": "20adf164fef34b12bc234e36620ddec7",
".git/objects/78/8ca11ef4ab679b1430642392dfd38e457283ec": "08f58eabc55c551ca0898ad53ebd151a",
".git/objects/79/c1dae0b6115a5428f9e629241d4657a549cf6f": "18cdb7c745ab6949806c5e25c9c1f3aa",
".git/objects/7f/4c2e921809a572968b1a7385dc267c0c0e1009": "e41c3d7301c6431c49d21e0a11ea5007",
".git/objects/80/393e3feeff53f964188cdad133f786a6c203b0": "0c03a71ccb51e12ee5d44cfd0cef5830",
".git/objects/84/e721d145441b5374f82bed5b26b657ac5e8a1e": "4cd20a32f6d245f9cf726c5afee8c4d8",
".git/objects/85/09617edbe1435cc6770b1fc7b7cac860a1da73": "31c7765f00a22507cec7bf2c7a51c4cb",
".git/objects/88/5d975844618c9377272f734d47196ee632f731": "00f74a32300697358213f7e283320ce2",
".git/objects/88/a5796c795b9c62be2e1eac970c0a2d64de3c70": "03ae40777fa5a91486fcd87bee9f75be",
".git/objects/8a/fafde6a649662e31637d54d02d0834a615e7dc": "7bf0843ee42b9cc5d9c6f63909892fec",
".git/objects/8b/ca6b00001681292ecb0a30b082fd557cf47fa1": "8f2253bc242c9b17daa7e3cebdd75a44",
".git/objects/8e/91eb3bd06fdf9100d62f7fc6295b6e58565d0c": "bd2e0c617bad483ccdfec45e38f13ac1",
".git/objects/8f/2a0eb351cc3edb1be50b562a77d149bda655d3": "93275110608bd7be9708a0f1b050f801",
".git/objects/93/2df0a58ce15860c4c5801c66c7895ad56eff07": "3e4190dd3b211bb807e9e03ecaf4170e",
".git/objects/93/555da411c91048ec9231eb1f7a7338e5e59328": "8c686b4614f451ff63ebc1ba05e3d217",
".git/objects/93/d81f236d42f58c45ad905410309c27efd46daa": "995f44f0e221270eafc012a1f7539c17",
".git/objects/97/1966ac6dbfc125652e845c65e189c9ea2aa729": "04ee18d53bc20299498e6a7276d373d8",
".git/objects/9c/e9182879d47378b798315d38ad1e478578a136": "351e0124e45751949d4c2da7524ef654",
".git/objects/9e/33d839e21892632e169bd3752491ddb48a788b": "cbef1c42813a69a0c63e44e8b263a1cd",
".git/objects/a1/0810a376f031d82b8f642011c948453955d21d": "4ac18c180d3c0e223b2ac0ac98a2be81",
".git/objects/a1/5f256c36e926d78f7ced52ac5e5b470a368d5a": "f499c3c20a222ade48d32c3a56ee9b13",
".git/objects/a4/dc91779000e196205ba4688605d51c5030990b": "cbaedc642de4aa83718d12a8b566cad3",
".git/objects/a6/c7b3a7943414cfa4dae69f13a976360ea1e908": "e095bcf7799fa0f02c8c48274d389084",
".git/objects/a6/ffccd21b8d4f0ea5cb3df21895b0e30af9ef91": "ca1e931151e24b0e51d454fd57d09c35",
".git/objects/a7/4eee2e894d9800aaafdc84c36cddbc3a13c8c0": "ebd2e1a251ceebaefb9bffa6dc8fe5e5",
".git/objects/a8/94567510afdb17ba2587d66f695486b9343661": "92e759a76328f29c4ac762d1bbddf87a",
".git/objects/aa/10a3e408a2b739e61d2a642d3dfad4d14ca112": "4b306034c6a6420fcf964b31da7d5fec",
".git/objects/aa/4a79d4126505054fb6a84cb631b606fb936569": "89a458b9a3fd090a4fb0f68e1a62c62b",
".git/objects/ac/dff003233d90b91aebe67dcd38d5049aacda7b": "6fea100e06e06948e49143e92be1a8dd",
".git/objects/ac/ecb59fb67eabc62a86038b7339699c5bd66574": "2bee312bdad050832014af9533303f57",
".git/objects/af/4f0eaff4809e4648cd1b0f4231102d072b4519": "b7dd373f9c9976eb8d54f66376336024",
".git/objects/b2/4d71e22373e5147f3c05c68a8742714a89b5d6": "6878165a2b269102ca92088485b7c694",
".git/objects/bb/b017df8b668bc2e1e36f51d343385d7b92ad10": "67633de59758020b9f3c3e6551dabc10",
".git/objects/bc/e937c1fb76775b89965e7626fecd4e152c3a48": "5d6b565528d9e8690e20a5bc82e2fbdf",
".git/objects/bd/8300de08c291e509d67a4056711a1fe813ad8b": "e445efb8154e70422561b03ec8577f26",
".git/objects/bf/ef9273e5b73e0a7e5a77f182d6fc93ae09a3a3": "d99f702468a94dd88cfd2fec856db35a",
".git/objects/c0/22c82e995ab8d4e64d9bab4efd605fcee1a71d": "b6e09b69d45a3b41ad3252cbe2d51605",
".git/objects/c5/bfdaa579cbebbda48b580abc6b397342651bfc": "ba5025483a947e446614a0667816874b",
".git/objects/c5/e9a8fc293814e51f7b213239045ce09ad8e4f6": "36546f3c8010b59fd7765978e621a4e5",
".git/objects/c5/f1ff10e753d0f3595bce822d2944a003ac4ba3": "4e4bddc69750369e236098e577732899",
".git/objects/c9/04c9573e83742e10a6edf73a1e4cc253355f54": "0ddaa2f4c1a31fc993d74147e5928715",
".git/objects/cb/48b56dcd79b3ec8ae05438f465bd4a628798f2": "bd2ee6632345b601941ce1b77029ba34",
".git/objects/d0/03a53106e1ade6309cf2760ecc84a8366cd26b": "474300794b39665fadd6d307c29e5463",
".git/objects/d4/c1bcb04bafaffd3de97887549912b28f6e4efc": "2dc9286ece8880da871fe893ef673f90",
".git/objects/d5/ae6affd5ce3ed6d9bd8bf63d942dd741636f58": "d53beed28103441f1dd4c1cecb969e16",
".git/objects/d8/8313634674f51073d8a8bf41d4401a859baf3c": "37657ae88f14040011a25073add316b4",
".git/objects/d9/34f571c1ff547e2e998dffe651e0e980d3970b": "8fe714439560481b929a726f7ae5d306",
".git/objects/de/28db843d7df6ed23b8a7526f6b6b4a83425fe7": "797e4f7b3d8dced098c51679ff33e848",
".git/objects/de/2c5c3d9255633dea011c576350ae80996012c2": "4270cf9c42ad8c456162ce0c52d85976",
".git/objects/e0/be8f63695800807f74c68d8a99c7b48fdec6e1": "26040687a5e7077cb630294560990d89",
".git/objects/e2/f40db99a618bdce8476abb35bbb21235b0ae71": "dda576a5ae5ba0c7675a91eb984ebebf",
".git/objects/e6/a806198e300c295eab268cbffb2f50cb31330c": "2affebd2a730cc8c5fd52a3a74ed1c34",
".git/objects/e9/e575d0b36ebd696294496017834c26b62e1505": "8eca52e53d59927cc7c00a13888ea67b",
".git/objects/ea/40cb182cf17dc3b74481031875d9958c68d86b": "6a8096e1fad8efedec073ff18b35f428",
".git/objects/f2/3650e74b3b0a36b54a6984d442d7c4121177bb": "b88b725b016a3f11e4534c6ac1384294",
".git/objects/f4/8f3511d3ccaae27572ecc92758c9ff707e8f58": "7056099c1f69b7fd7d80d9c3f928e7e2",
".git/objects/f6/bb1d0f67127328d57f21e8e9f24cc29b976e2e": "2f2d0bc7f95df92b13bef74d85fc35f3",
".git/objects/f7/dca7fce9fbf94ffca2639adbd968ddc20993ab": "1c1f97e9d6c2a47ab9577428d5d81f83",
".git/objects/f8/3b2e38cbba429899ed0907fb43ae286ecef33e": "e964206e329bb545bd10985183a426d1",
".git/objects/fb/2526cbeda30789870cfc1db1af4a077c3176c1": "c2cbeb816167c37d5dd64bfa6f7c0291",
".git/objects/fc/3bf3283a79089f6bfed838532ebc4e504a4336": "d28d8555e5bc6cc0699e6adea3f39783",
".git/objects/fd/cbd6e3cbffb5207cceab363f755f68473fd8d5": "b6e59a3b2e48c134b0c1becadd9fc4dc",
".git/objects/fd/cd8af7534cf465e646ea57f8b081e0a61101b3": "ab06da4c1d2d9ffb31080a71278fa367",
".git/objects/fd/ffb47c9ed8d186c21ca0124cc579dcf49eeaec": "4483efe380f1524ef6429c870af40971",
".git/objects/fe/1302acea02d6a1c6447cc2d7e79c61386727d9": "e461083a213064d3701c6e63581760e8",
".git/refs/heads/master": "52ad2e10071446cfaa372024f84a8142",
".git/refs/remotes/origin/master": "52ad2e10071446cfaa372024f84a8142",
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
"assets/NOTICES": "cf5fbdbe735d57104d24aec9f25d8a11",
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
"index.html": "d81feacb1404c78de095bb9aa6e74c3c",
"/": "d81feacb1404c78de095bb9aa6e74c3c",
"main.dart.js": "a59333b86dcc344b04beb27f912c7009",
"manifest.json": "fbdf04a597dd3dcb38ce98c382a1c3a4",
"version.json": "956c16afd61d480d9126cd4bccf88957"
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
