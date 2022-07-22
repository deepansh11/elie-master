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
".git/index": "70356f3e67b44786d7fb286d7788d330",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "6ce4a7180cd459064c5e645ef182ccb1",
".git/logs/refs/heads/master": "6ce4a7180cd459064c5e645ef182ccb1",
".git/logs/refs/remotes/origin/master": "44b3b08a4ffba6a6499bd623311187f6",
".git/objects/00/22caa94d4f6922d5ed8c37a877e731d05e5fcc": "3c89ce6554ae8235101752c9873296d7",
".git/objects/00/3455badf368e147ef089594637d899bab966e4": "44337bebc54824d0a807396bdcf8ee3b",
".git/objects/01/e55807cfe28e8140fb2e9044dc753785c4735c": "1e4593df6cb9e97a54bdeeb1edca9879",
".git/objects/01/e7b17b260a304ba111dacd1fd6dd4a3493d467": "f332bbfc5aa33782a680e4ea85b88808",
".git/objects/02/bb649b1bc1346bb423cb3aa144af0907780c1d": "06a05d9ba243c48576fced5eb99bdf89",
".git/objects/05/982977cfdd2d031978b84a36adb8d9e3132706": "f8bd6cf270f86f61e21f5c9681cdcc9a",
".git/objects/07/9105993d044a4ea507fed50d5ad18779bb5c73": "abe08e377d7fdc605c24ed3cfeea4c39",
".git/objects/0b/34134a7fba8bfaf87fc5866ae29f9b5e27cc45": "d6656dca82771ecbd45e35a2f63ec7df",
".git/objects/0c/89ae71e305f232ddf8dddaca6fd1e56a881a93": "20aa5d4b0fef62143b7435d4dada85fc",
".git/objects/0d/0df08f7c3e147a8ae36017cf81a96e35b73717": "106e868f28a72727fb6fb0fa71123633",
".git/objects/11/8ec3fa0c3e7632063ee80bb4438521deeb1b3b": "e70779437271c61c131114636a8643f0",
".git/objects/11/ebe0abf0e894a859e0fb58e7eae195cda45183": "a448adc1da0456db701dc50d773d932a",
".git/objects/12/19b5de37166aff5a84418f57c01e426cbe8d08": "94aeb7a927fc530d20ebc1f9750bed74",
".git/objects/12/3675b8a36322efb4479145774993aae2e57db9": "03a8ac700286a02679b356b3d616cd60",
".git/objects/14/59f4f4f5f3e0c1a0f78772ad72cb38815adc91": "edbe050c2e9c510bcd91a1c10a752abf",
".git/objects/15/805f9f17364d020880e2a6736ab6353646c749": "640973db8aff1626120b4c06cf1d96ca",
".git/objects/16/bd791429ccb3077742ca5b7354ad98a0bc2fa7": "c76bfde8b9b82540c839a489ec8e3380",
".git/objects/18/0dc98954dfc31f829bfa0434b2755516b52650": "90e00875ae50fc1c3ebbdfeebc0446a9",
".git/objects/18/a8b182917631c4f00479eed173123062fdf168": "c4f105b2132e3bc43bfaecfbded47676",
".git/objects/18/aeb2ae7468b5f9edae0ff7da45efd522a6d4d0": "e159707edd8c161661ab8e6c9276a05a",
".git/objects/19/6ec5476ea56b27322040be406251a79f93c902": "5398c70dfb152f8ab20ac9b1a2299904",
".git/objects/19/97934effb14440acea0aacf0967b88ff065411": "677c8c9123815822ab9b49a862dffbb8",
".git/objects/1b/d97dff6e7682510cf62c2f3e4080fe20235577": "ddd571a8ff353a255f90b69622e19205",
".git/objects/1c/daede23d894be182725c012546c53ae6b74557": "b3997767a81ed8ba590f215867a90dc7",
".git/objects/1e/c649a76f5d43fcfcfb073c8a5c87591c24f64c": "b42b00b452c61ecbd4434517196b0da3",
".git/objects/1f/9dea86d49da71f095111707d03b9140eb69733": "0bd4fa0f40267bf0e6d88529e788d60b",
".git/objects/20/0bf5184fd3c584c604c105d9ef8209b8926565": "4c7c7111064b0ec391cd2aeea805492d",
".git/objects/20/9052e8560187aa3ad9e48689acb0832415c05f": "f569e6fda1d771eac84efe166ca19a67",
".git/objects/22/0b101c1c43ec4b033a36fc510cdfcaf3bf2251": "31bb4c4be808bd22c286eb8bced20b5a",
".git/objects/22/bef9cf601b623421031f33c4165b91fa4e7342": "3b3d0ad084f9591f2abfaf7b4e5e2cf6",
".git/objects/24/638a1733c9952a2cefda3f140bc7ef7b9451da": "47da4109b834adb7ea940f5ec4892420",
".git/objects/24/b1f14dd348b07c9b8373758bde9ac14d16fd92": "dbf45d6c044044561758a334420e9569",
".git/objects/25/1e5843905265aa5015a0dc8db53248c7ad6a85": "a4355e6b16930defe64ce721c3466d6b",
".git/objects/25/ff4bb8e13dbca18873abc8dc12d5e5c3edebe8": "585c9c42a0267a30e5f89427e9bf4e73",
".git/objects/26/ac9c49c1725f590f62eff879adebcf76745493": "6bb95bd6407ce3811c3296b38eb63caa",
".git/objects/27/8b51f8aefc78acedf6173ecceac4e2e6db790c": "8b79f9ece2b32aa55b94aae81f2d7164",
".git/objects/28/2e85e54a9d6291535f42ffe9eccf737ed47d4b": "534b3ee66c878c66edfaeb8c12dce3b3",
".git/objects/28/abc991f543724d7300e8e86939b3eb9da91cde": "7e75612a72fb11a9b08d198ab40dbd67",
".git/objects/29/2214367c0af9a2eee8f873b2944224e2fe3f0c": "902d6cf3d5ea70392a74bfc9ded583bb",
".git/objects/29/91fdbaa60a05df750f30daa6d8ad51b67484c8": "93d93f66b92f121278b23fd7f5f7639a",
".git/objects/2a/94b4646ddb7e468764f3b4adb982ad867fea16": "aaaaa7f521ea04596ddafecfc7ee78e0",
".git/objects/2a/a6041035e7fdd2d21f2511c1833fbf2d240dd5": "51a1613530184d29509829ff12c97937",
".git/objects/2b/dc0448ff03c601461926cdb9ae1078ec58ec4f": "88c22118955544223d324b7a76c4498a",
".git/objects/2c/0421645bc68b7fb9aeca7fce514baca84701c0": "dbdf288c9e258f2aebdecd6c2aa53ee4",
".git/objects/2c/547f0485445fe4d048d2686d28010489fcd8b1": "6a801453989ba86351ffa92a3dc7ccaf",
".git/objects/2d/0471ef9f12c9641643e7de6ebf25c440812b41": "d92fd35a211d5e9c566342a07818e99e",
".git/objects/2d/cf3542c874e33cd8ab86ceb6f0ec444228aa78": "66baad0ae5d874f09b6eee790095bc65",
".git/objects/2f/017b675d005aa4e3a4308d0fab54ed3a9d3ec5": "39e43eaf57d21c8cbc45b8c43154923f",
".git/objects/30/3ccc95df415ae51b66898f8927329d799714c8": "08d2950142223371e1ddfddcc9d5cfb0",
".git/objects/30/8949b8ad7a6c1e980e7008d407c537880500da": "955373a6341395c130224112bee57dbe",
".git/objects/32/5da6c5e7a6e44da9934bdd95e5bd8c96a0e8ac": "3c8f9265f8e9e2835c1ea36207c01c3b",
".git/objects/33/4a3e9132735c5b7ab36e87e02db0a1253a147d": "8b31fd02e54b318fb296c6bc46fb2be3",
".git/objects/33/7f73b35d5ec58813fe76aa554669573bc10e2b": "0da6d222bcfdc9c0ee4f9288ee8ba392",
".git/objects/34/6ef8c8bf7e735ad014abc9bc92c9d7ddc9d55a": "8c6e73679674ecd2062557712cee0d2c",
".git/objects/35/d2c098d1fa6515af08b0b45f625257f4e3dd55": "92b989d921217d4503336687e14cf66e",
".git/objects/37/55a1f9e9b241621f2a8f094f2714d8b0f574b0": "143748d46d67de9d58ab245eba296689",
".git/objects/37/a7e521287fccf4bb71ccc2dc658158fe6d00ad": "3ec57d51ccafb5b6e74e030fc2c9d3dc",
".git/objects/39/b9777a3aa154e64b531bbc3a629e5c6f88aa24": "f539bbce3060911fb8f30c683919a482",
".git/objects/3b/770280e9a58142e77464bba56cc3b21ccb6eaa": "09b7bdc1b459b8937aadc96a02507502",
".git/objects/3c/50a7a4c00e14b320736a77d4777f4d507ccb17": "250db914514a4b0ece05a32afe7e6fd1",
".git/objects/3c/b3b53a24ee4712b8463133dca203ddd72fb43b": "c3066eae2c84f5465b93f0624f5ecfa6",
".git/objects/3c/eee28d908f250749740981b88ad577f0ea243f": "a06013fad567392ebe0827ae4919cca1",
".git/objects/3e/97266d5074364185792c091c1e5c249c8f2b00": "946241e05e601b2d563995d0b8082cf9",
".git/objects/3f/9b22a9e57d0ae2731f58c375e70eda60b0e78e": "f1f1d0758d350537c6c7ebfaa2d51cca",
".git/objects/3f/b654f1566b2e20ee7eb5639874513ebc293600": "40fa51c4cd97b4189e4db4005e95ed3e",
".git/objects/40/5253cef5ed302d9e298572786fc05e42ae0be4": "258761bffd9a7e28301e0f05b83161c3",
".git/objects/43/e794840aeaee958826142120e36714a7b1b4ba": "61eafbf6991d7550a06ff2ba994065fd",
".git/objects/44/132b60e5f86db0ac312e5aa36be052b63f7571": "658302ab90763705914c53552d8bf0b0",
".git/objects/44/722f63d15445d15fea33ee096ae2e64313a71a": "a703fdc24ea89323b0d1e6068bf74128",
".git/objects/45/59cea21e53c9531d8486aba352e723647d060c": "08df870fc62823d763173ec56d3cd998",
".git/objects/46/bc9491aa7b8ff73b7c7b82e9b03a91a2a362ba": "5407ebc2a390ea01cce7cf904a5a1fbd",
".git/objects/47/c69e83093a545f9224378afbc36b7894c96228": "ff093453a89f13f620b683d7b214deae",
".git/objects/48/1fb40b67bb761861d2f95054117b85c758fd4e": "64eb06909d257811d067fdd840b6c2a2",
".git/objects/48/41a58d7ce75d9a694b0b385b3e7cce97da1f1f": "6b2a04292750d433eca2cec84c2acffe",
".git/objects/48/66971ab99ddaed608448e28898c2e5ddb1657f": "c8cedf26185886d6b603ab1f4ce371a9",
".git/objects/4b/197b70593990d9a8bef719009d25d98a4fe95f": "0de94c447d269ae36d8fceba1b2488d7",
".git/objects/4b/bc7a2f845a23bf1d067e148f7f3c80ba5c9491": "edb42fe38721751e991ea049ab1fbdef",
".git/objects/4b/ffdb10dc287077d86e81742538ef38cb9308f4": "7b9f9ef17216c662bad97c3fa0cb898a",
".git/objects/4e/28dadc6834411dbb1a494c0aa366154c1ecacd": "f033aa6f30f353010df3976588d30adf",
".git/objects/4e/89617a3696bd10c155ec378f4a65a9f89e9e3a": "d8056e20bae90d092b619c895129e982",
".git/objects/4f/3de3de3fddecd8c4908aa52ac3085ce655f19f": "760d9243c4b5ee0eae788ac37db4b39e",
".git/objects/50/8e45d36c021715cf68271613f3365f2b3c6d67": "836a7ffad92734f0560a948900f8f680",
".git/objects/50/afb004344c72a851689f55de4f4449a470a2fe": "9c73b1f21183e8324bb2653babb9a9eb",
".git/objects/51/eff3df9fa36a18b4d138e4f7e4089bffd8a564": "48a724ae9507f5cff5c904783011a500",
".git/objects/52/1b89a7768ca5d5c1daff69ba000abdf947dbb1": "016f1e60ae6fab0f385f5fbd79adb666",
".git/objects/52/8d7881e6a6343d76f4a34936634e9c3f109d0d": "2545ad56fc357abba06c51460986920e",
".git/objects/52/9a45f6973c1bf559edc346c53e9592e79a96c9": "8bfd6cbb8194501db13cbfd7e15f13a1",
".git/objects/53/ce046035b483f63b90076c2b04c65a64150656": "818c2b2eb97a46b419cd0ce7869ea46d",
".git/objects/54/f2aa8db672c097fc84be94a91ebee059a8143e": "ad99a72fdd53d33c2ab8ad85bf343e75",
".git/objects/56/13a22250267de1aba4cf4a5bc1a1f758c20c12": "8e44702ad07b9a08b0b5e63eaa9292e8",
".git/objects/56/327d92f1e42faebc90116cfc744f1dbe0202ac": "c5ac1fdebcf935f054d157648e44e9d5",
".git/objects/56/6182b121fe30e5357e0acd95d6b6c9a860980c": "7b7e7bf497874386a9d5f6c71b49f3fa",
".git/objects/57/0ea808cf9c3d8fcec7c15cfc7b300026effcf8": "9f46e87543a9061aca70863611da6d05",
".git/objects/57/679c15cd015b8a655f208170056cde7a031ed7": "9ab77d09fa0c20120b852f0588631276",
".git/objects/58/6765dd1b2351a5d3baa57bb358f92b00f79f30": "17c4b833140790c28414024b8c755494",
".git/objects/59/6d73b2056daf8d73fe36c5844ffd50a21eeda2": "69d80f6e2f32e218d98b5238e9a3bbd8",
".git/objects/59/c719c5b3fff3be8d8fc1d0af381e0d78f52254": "adf121505878c7a96debf23d65be409c",
".git/objects/5a/ab02af6249bc42f57f091cb0c1b3dedebca382": "cd395894df43b22f520d72b53dc2441e",
".git/objects/5a/d98922411b52f1f60d85dfc027646558df4e41": "745a9fe2e0fb42be6b829326d07124f8",
".git/objects/5b/a1c81385bd44be284a8eba64b2590f010de6f7": "479686306057002cd0bfa41833b263b8",
".git/objects/5c/78d835bf72fbfda4e41fb9a71b5afd432f0945": "7a85a593d291862426d9a881956b4376",
".git/objects/5e/e56ae97e3808a853249d750460a9dcf0613b03": "6e736291fa607f41ca8f16db0d62b132",
".git/objects/60/52c15aa8818e69ffbc3a0c87ca975b25b89822": "4540542a1de43512cf53ea33071eb707",
".git/objects/61/f6bd7cb86485f47de52319cf16db9f19189ac8": "4de4caac88340123e99755071ffae6ad",
".git/objects/62/0d0a61449417fca4b18ba51b98edf605ff4ddb": "3e63ebff786bdcc8e3211fc258235835",
".git/objects/64/b92c25d504646dac1a520d4308abeee5812fc7": "cabf6427bd60ccd8b259adb1dacce96f",
".git/objects/65/5a67d9c5e964624e3b5526d39946d1b07ae4e5": "b8f1515e2112f14a4e3adfa02f377bc7",
".git/objects/67/d137c07d9adc3d6760a7b1510661d3e164747b": "54d6dcb1840967adeb84903b20a8f39b",
".git/objects/68/081f13188376dc7a78f666f74748275fd0b2ae": "e52a3138ad32da146478620deb522c36",
".git/objects/68/ed15060bb09b078c954c886fff4ffabc25b87a": "e61c26b16b746eaca50ee2e78d1f6d1e",
".git/objects/6b/2abd86266ad1089182abce17c92461f0363107": "25f7d9a1dbd555f141ff166d6c0010c6",
".git/objects/6b/fb04d306e63c7f03696193c22f5a0dba338577": "39593cdcef2dc4af1bbfab184adfa4df",
".git/objects/6b/fe1c80aefa432184a29a55a30811a4c2dedfd1": "42e753dbe0a795353e5994d07d16c5e3",
".git/objects/6f/5fd1cd29b087df8098e5b5b09f8e14000c518d": "08ef15f06e1f20cd9d7f2a4c2a7f55f7",
".git/objects/70/2d09a6c5ab2cf50b670597ba91f8f51a5017e2": "8969f55bb90af1e8cde8b19f496a7826",
".git/objects/70/73d99f118f1ecf8934959686982e2bf6ddbebb": "30b00c5776743b4b486fcc2781897557",
".git/objects/70/7fa5b045eaf97897f0923b8a15dd6f23d2f613": "5388760ca3f03004157af8538266457d",
".git/objects/72/1f9d7713bb12435af658b98ec0917a13ea2891": "4d374694625f630af8ab77e123f88ef9",
".git/objects/73/b3cf73dbd804882466aaaa574fe334e0425405": "03bca42b77a98be432dc59f4ad45ce99",
".git/objects/73/dfefb8815fc384adb61a3ca188a58b9229d6b5": "43226ebd89b41271861c91dd30c18713",
".git/objects/74/592ec85c0a7cf12c516f30a522bc59b37a5938": "e0651060f54dffe2d7bef59b974761c5",
".git/objects/74/93469c7622f68b2787e5ac8bb86acf1e8db8c4": "e1eba76465e2bd7d334a238d347e1ff7",
".git/objects/75/b4517eb611c1311962ecc46b9e61fd498e2473": "5a6c9c1f2a8e9e6cf4bc3ba3587b9506",
".git/objects/75/ca15bd3c95acfbc00919620e1f806808b2c8f4": "08d83dfa3736a08bd9fe7ced15f0ba4c",
".git/objects/76/849afbc94184567a9ce4810a550c4f111ff357": "d27ec83ed758ed40d6433bd6ed72542f",
".git/objects/76/8651b2e249c2517c7b37bdbeea0a5d8bfbb707": "495b1c4fefa633f6afe4dc5840ebe18f",
".git/objects/77/1148245f6b62a19e28a666e0301216b58f2f9d": "20adf164fef34b12bc234e36620ddec7",
".git/objects/78/8ca11ef4ab679b1430642392dfd38e457283ec": "08f58eabc55c551ca0898ad53ebd151a",
".git/objects/79/c1dae0b6115a5428f9e629241d4657a549cf6f": "18cdb7c745ab6949806c5e25c9c1f3aa",
".git/objects/7a/ebe7d14dd2a876af5016912163864308c9ba26": "20a9b47b0907ac100ed2f1412073b1b5",
".git/objects/7e/c6519ced2c03e611a5a2f30bea8e791dfc9ce4": "318f0465dea3d6212e51e099ff268eba",
".git/objects/7f/44a913f1597f6f9c5c40a5a9fd35de708d31bc": "4885b2d433ca8a473a8c46246823d273",
".git/objects/7f/4c2e921809a572968b1a7385dc267c0c0e1009": "e41c3d7301c6431c49d21e0a11ea5007",
".git/objects/80/393e3feeff53f964188cdad133f786a6c203b0": "0c03a71ccb51e12ee5d44cfd0cef5830",
".git/objects/82/a4e34e2a64e0bd88a25d3538cc2b5444a567c2": "b43fb93a283a490e00bd1b51eaedf823",
".git/objects/84/e721d145441b5374f82bed5b26b657ac5e8a1e": "4cd20a32f6d245f9cf726c5afee8c4d8",
".git/objects/85/09617edbe1435cc6770b1fc7b7cac860a1da73": "31c7765f00a22507cec7bf2c7a51c4cb",
".git/objects/85/fde9e225fddcfd929cee5a69e4c92ee4fef7e9": "3efa83c211aa764f0668662a1f21e7f2",
".git/objects/88/5d975844618c9377272f734d47196ee632f731": "00f74a32300697358213f7e283320ce2",
".git/objects/88/a5796c795b9c62be2e1eac970c0a2d64de3c70": "03ae40777fa5a91486fcd87bee9f75be",
".git/objects/89/fc3022467f7338b9aa3982b58fd6cd3a335a73": "6e2cc7448ef792ca73c16ad08e87461e",
".git/objects/8a/fafde6a649662e31637d54d02d0834a615e7dc": "7bf0843ee42b9cc5d9c6f63909892fec",
".git/objects/8b/ca6b00001681292ecb0a30b082fd557cf47fa1": "8f2253bc242c9b17daa7e3cebdd75a44",
".git/objects/8e/11421d7aceecc19190f8541f90cd688311f0ed": "53a8c73eb829a2e745fc6d490843c851",
".git/objects/8e/3b17a37d62993db237b20ba896703a3d55ee1d": "9ecf9b6f09a2913eaebefe2fce9773ae",
".git/objects/8e/91eb3bd06fdf9100d62f7fc6295b6e58565d0c": "bd2e0c617bad483ccdfec45e38f13ac1",
".git/objects/8f/2a0eb351cc3edb1be50b562a77d149bda655d3": "93275110608bd7be9708a0f1b050f801",
".git/objects/90/05b01ce8ef214b9d39fd09931bf47309d8edb5": "c5014b549b888c26c1d4c32d699bd281",
".git/objects/91/6ba081dd2b6dc1ba2bd25f8ffbd95a1b25b2bb": "3aa883813c471d8c27ec1c1fedba63e8",
".git/objects/93/2df0a58ce15860c4c5801c66c7895ad56eff07": "3e4190dd3b211bb807e9e03ecaf4170e",
".git/objects/93/555da411c91048ec9231eb1f7a7338e5e59328": "8c686b4614f451ff63ebc1ba05e3d217",
".git/objects/93/d81f236d42f58c45ad905410309c27efd46daa": "995f44f0e221270eafc012a1f7539c17",
".git/objects/96/3058ad79b9b954031c59977974ec3a1a851561": "0d66f43dd1153e4f0ab12c9e0ae5ee9d",
".git/objects/97/1966ac6dbfc125652e845c65e189c9ea2aa729": "04ee18d53bc20299498e6a7276d373d8",
".git/objects/97/282ef78fe487a4d7450d80ae9c0543294440a4": "6fa6564f79b0b1102c63cc9b4db85f84",
".git/objects/97/368e35bbf620501aed1260abce8f8190693360": "6a13263877e175143b6a7ed3a74a5082",
".git/objects/9b/a964b4701b8633ec879152997a5037e6f81ab5": "38cda52b5be46029047542b9054e856d",
".git/objects/9c/e9182879d47378b798315d38ad1e478578a136": "351e0124e45751949d4c2da7524ef654",
".git/objects/9d/a51ceb24c138f8db05ab45bb809b9e6502c051": "53bc83d0024df8919e0a31b9f38fd89c",
".git/objects/9e/33d839e21892632e169bd3752491ddb48a788b": "cbef1c42813a69a0c63e44e8b263a1cd",
".git/objects/a1/0810a376f031d82b8f642011c948453955d21d": "4ac18c180d3c0e223b2ac0ac98a2be81",
".git/objects/a1/5f256c36e926d78f7ced52ac5e5b470a368d5a": "f499c3c20a222ade48d32c3a56ee9b13",
".git/objects/a4/dc91779000e196205ba4688605d51c5030990b": "cbaedc642de4aa83718d12a8b566cad3",
".git/objects/a6/c7b3a7943414cfa4dae69f13a976360ea1e908": "e095bcf7799fa0f02c8c48274d389084",
".git/objects/a6/ffccd21b8d4f0ea5cb3df21895b0e30af9ef91": "ca1e931151e24b0e51d454fd57d09c35",
".git/objects/a7/4eee2e894d9800aaafdc84c36cddbc3a13c8c0": "ebd2e1a251ceebaefb9bffa6dc8fe5e5",
".git/objects/a8/94567510afdb17ba2587d66f695486b9343661": "92e759a76328f29c4ac762d1bbddf87a",
".git/objects/a9/5662963615ff8631e46e4f0ad16d8c7e796d0d": "5fcc1c4e5488942627bbe983b708bbb0",
".git/objects/aa/10a3e408a2b739e61d2a642d3dfad4d14ca112": "4b306034c6a6420fcf964b31da7d5fec",
".git/objects/aa/4a79d4126505054fb6a84cb631b606fb936569": "89a458b9a3fd090a4fb0f68e1a62c62b",
".git/objects/ab/cda6df37a821a5d7f24dd0493bc99bf93aaca4": "f027c36c4bf64a680711b6816337623f",
".git/objects/ac/8c9ad54acc6ca04de28b77bdcd959ec7b1daa3": "811bad2ab66a66758b809b4a61416dbb",
".git/objects/ac/dff003233d90b91aebe67dcd38d5049aacda7b": "6fea100e06e06948e49143e92be1a8dd",
".git/objects/ac/ecb59fb67eabc62a86038b7339699c5bd66574": "2bee312bdad050832014af9533303f57",
".git/objects/ae/b966520b7fd80289624ca20c6978ae7fb9142a": "e0b9605d59b87536e80a074062d10d3d",
".git/objects/af/4f0eaff4809e4648cd1b0f4231102d072b4519": "b7dd373f9c9976eb8d54f66376336024",
".git/objects/b1/67fce7d4fdb6aae3c71d8c9b6ee189e0a31d14": "553d7a47a83068bd6486c45cbb38f31d",
".git/objects/b2/4d71e22373e5147f3c05c68a8742714a89b5d6": "6878165a2b269102ca92088485b7c694",
".git/objects/b4/780f20bf091249c6b96f393798154bca491a21": "84b0046ca2bd20b6b4894959ee0a1730",
".git/objects/b4/ac9eb7d02ae3586b8a4c47e63149c3593c5526": "dee9578c4fe40566ea645d9e13beac8b",
".git/objects/b5/a3fe1fddb9b7550c25f19c188679ede6332a6a": "e6dca1432788203611c6a7f7f0d4be79",
".git/objects/b7/cc6ae7a5edc5848d504b7907b892c39ff01058": "3d2911215b8aa401d5cbf9cabab2bd2b",
".git/objects/ba/23c1390b2a7820da7fb60fd9d03e25c14f70f1": "788bdfb29ffd8114d155cba675ad4a28",
".git/objects/ba/38a4f9f5a75c1f38e681991ad7e82060094cf1": "a0a7c0b43eb04a20dd79ace50aea927e",
".git/objects/ba/cc579ca9c278330b2f91aa617e5c70b19f2c0f": "6d80007357358cc507b95aa5a395ee5e",
".git/objects/ba/fb6c9f9e5cd94185699ced4cb7bc18f82790a6": "eedd4cb3a13e1a0c40a773c9e971d808",
".git/objects/bb/a5dc7fa6f3c98525fdb78648d7a939a09085cc": "ab825502ffb661c6b88475d37ed8244a",
".git/objects/bb/b017df8b668bc2e1e36f51d343385d7b92ad10": "67633de59758020b9f3c3e6551dabc10",
".git/objects/bc/e937c1fb76775b89965e7626fecd4e152c3a48": "5d6b565528d9e8690e20a5bc82e2fbdf",
".git/objects/bd/2df4d93e34b7679e48e6252745f8a7c97dde65": "32308f08e3bacb3b8b7fcae7d923fe37",
".git/objects/bd/8300de08c291e509d67a4056711a1fe813ad8b": "e445efb8154e70422561b03ec8577f26",
".git/objects/bf/15f728a5c380f356d202fe771f6acb10be0f1c": "e5bf4747ccc9c851f3e3a89d62f27de1",
".git/objects/bf/ef9273e5b73e0a7e5a77f182d6fc93ae09a3a3": "d99f702468a94dd88cfd2fec856db35a",
".git/objects/c0/22c82e995ab8d4e64d9bab4efd605fcee1a71d": "b6e09b69d45a3b41ad3252cbe2d51605",
".git/objects/c2/003a49ca16c4985fac2920e343b568f10a1490": "f275fc49372b5e9dee37065122daa01b",
".git/objects/c5/bfdaa579cbebbda48b580abc6b397342651bfc": "ba5025483a947e446614a0667816874b",
".git/objects/c5/e9a8fc293814e51f7b213239045ce09ad8e4f6": "36546f3c8010b59fd7765978e621a4e5",
".git/objects/c5/f1ff10e753d0f3595bce822d2944a003ac4ba3": "4e4bddc69750369e236098e577732899",
".git/objects/c7/0bfd3a2a8fa08648305e585c46f7a9ece5a6af": "b29457032a8bbd50548d09249927189f",
".git/objects/c8/c589af780b8734a3fd97987a77640f5cea6ff0": "e1caa1a12c4f7084b0753de55ac51d8f",
".git/objects/c9/04c9573e83742e10a6edf73a1e4cc253355f54": "0ddaa2f4c1a31fc993d74147e5928715",
".git/objects/c9/a69bd8d15a59c8076a80d20840733e15975e84": "3be8415ae6fae51fef6f4f2fa7570869",
".git/objects/cb/48b56dcd79b3ec8ae05438f465bd4a628798f2": "bd2ee6632345b601941ce1b77029ba34",
".git/objects/cc/05dbd67a7b458736f75f163b6c1e6929fed7bb": "a389bebd95991f5ceafb58c8e37b92ca",
".git/objects/cc/1a993ccd66ed3535a75e34669164987ae48421": "f2131c0a93fa99f44e9d0b298077ac3b",
".git/objects/cc/7500093d2f85a098864974795c3d3f7e1250a7": "a4aded4f00cc31998df9fb43d19a87dd",
".git/objects/cd/e12706e920c7eb637cbaeafe7798171d1b786e": "60004e423082e594b18b79adfc8fb710",
".git/objects/cf/07419fb619f0f8ff986ec759c29134ab8772bb": "2cbe154b3709b4b0a069e131b955d1a0",
".git/objects/cf/b601e1a097c73077ddfb86a74802a8bc160e2a": "ee7905faf5183ced948bf890b8d8d3be",
".git/objects/d0/03a53106e1ade6309cf2760ecc84a8366cd26b": "474300794b39665fadd6d307c29e5463",
".git/objects/d1/6e0596ff9db68a0d368bea62da201b2cd89094": "1e1eda47d76a8b6742177276047a8c34",
".git/objects/d1/dcc900815cfb6b4737675caa23585d4fd8a874": "2db201687b21cca533c6919634381318",
".git/objects/d3/6f903ce985676aa14a50d552d0df1845ca3a62": "54176592fbea823eef10cd2b351dae34",
".git/objects/d4/c1bcb04bafaffd3de97887549912b28f6e4efc": "2dc9286ece8880da871fe893ef673f90",
".git/objects/d5/ae6affd5ce3ed6d9bd8bf63d942dd741636f58": "d53beed28103441f1dd4c1cecb969e16",
".git/objects/d5/b4c28c19e478026186c92043c786e31b3ab81d": "4a0afa9c3b7059b8aa4bd141bdb6aa67",
".git/objects/d8/39c0fc492b0029fc004845f679929d4464751f": "8eef458851d53b3bbfa3eab6cbbdc3ed",
".git/objects/d8/5a42c42b094f38387bf87393ec7b3acc256a56": "7c79405dd0fa563d67f72fa4fa3311b4",
".git/objects/d8/8313634674f51073d8a8bf41d4401a859baf3c": "37657ae88f14040011a25073add316b4",
".git/objects/d9/34f571c1ff547e2e998dffe651e0e980d3970b": "8fe714439560481b929a726f7ae5d306",
".git/objects/de/28db843d7df6ed23b8a7526f6b6b4a83425fe7": "797e4f7b3d8dced098c51679ff33e848",
".git/objects/de/2c5c3d9255633dea011c576350ae80996012c2": "4270cf9c42ad8c456162ce0c52d85976",
".git/objects/e0/be8f63695800807f74c68d8a99c7b48fdec6e1": "26040687a5e7077cb630294560990d89",
".git/objects/e2/63f07e146bc6166e41b40e0a38729740144094": "5e018ec97b4bccdfbad63a4fb5ad3e9b",
".git/objects/e2/67b9cdf60f9297702f983ab1a1496e0149e945": "17da1432b7fa5c1925eff21d31cbfaa8",
".git/objects/e2/f40db99a618bdce8476abb35bbb21235b0ae71": "dda576a5ae5ba0c7675a91eb984ebebf",
".git/objects/e3/3c5371fd96f0ed884e3b87e8aa96a9f1dac484": "b12d2881b136dc35d638a244ed145a35",
".git/objects/e5/bceb0e9935a237d670bc0311eb145489a74e63": "15798a0a278d5065c83f6edd629ca1ef",
".git/objects/e6/a806198e300c295eab268cbffb2f50cb31330c": "2affebd2a730cc8c5fd52a3a74ed1c34",
".git/objects/e9/e575d0b36ebd696294496017834c26b62e1505": "8eca52e53d59927cc7c00a13888ea67b",
".git/objects/ea/40cb182cf17dc3b74481031875d9958c68d86b": "6a8096e1fad8efedec073ff18b35f428",
".git/objects/ea/cb85a40da8152b3cfe5f68337c82358baca428": "90867a7c72441b9abfca746bbc8da17b",
".git/objects/ef/c0ef534de1431b743aca5fa432ef7f53b058cd": "074dd87fc394a14c2322dd2a04c4062f",
".git/objects/f0/9c0fc115733d8358ff52aa4e77e1e8a1a038ba": "3c6c59a335bc5b1c8a371680079417fb",
".git/objects/f1/eb539084e7b1cc6f7d7c2da5639ac48eeaae16": "5ab4332e77c36e24a77d86deee7e2ad3",
".git/objects/f2/3650e74b3b0a36b54a6984d442d7c4121177bb": "b88b725b016a3f11e4534c6ac1384294",
".git/objects/f3/b38a284ccad510de5909bc8f2ad18380073322": "a61b867b5bb6ae76511d6c8ce18ed981",
".git/objects/f3/cf21596f1ab6fe6fdaf3c5c42af97e5b99b19c": "df79ca4aa2b2fa9291112cecc0abc10d",
".git/objects/f4/1e85b13bfc30776bad5c536c3ba57a82061569": "50f8585383157269d2f6ae45236b05a3",
".git/objects/f4/8f3511d3ccaae27572ecc92758c9ff707e8f58": "7056099c1f69b7fd7d80d9c3f928e7e2",
".git/objects/f5/c5e572c3277e1b6527b7e68dd5030b2ed988b4": "37471d2ac0cbc0e89f9833fcc8054300",
".git/objects/f6/bb1d0f67127328d57f21e8e9f24cc29b976e2e": "2f2d0bc7f95df92b13bef74d85fc35f3",
".git/objects/f7/533e0c930e56904e24d8cb761a0422be259254": "5f81d3a570e62fb15262633a2318d333",
".git/objects/f7/dca7fce9fbf94ffca2639adbd968ddc20993ab": "1c1f97e9d6c2a47ab9577428d5d81f83",
".git/objects/f8/3b2e38cbba429899ed0907fb43ae286ecef33e": "e964206e329bb545bd10985183a426d1",
".git/objects/fb/2526cbeda30789870cfc1db1af4a077c3176c1": "c2cbeb816167c37d5dd64bfa6f7c0291",
".git/objects/fc/3bf3283a79089f6bfed838532ebc4e504a4336": "d28d8555e5bc6cc0699e6adea3f39783",
".git/objects/fd/cbd6e3cbffb5207cceab363f755f68473fd8d5": "b6e59a3b2e48c134b0c1becadd9fc4dc",
".git/objects/fd/cd8af7534cf465e646ea57f8b081e0a61101b3": "ab06da4c1d2d9ffb31080a71278fa367",
".git/objects/fd/ffb47c9ed8d186c21ca0124cc579dcf49eeaec": "4483efe380f1524ef6429c870af40971",
".git/objects/fe/1302acea02d6a1c6447cc2d7e79c61386727d9": "e461083a213064d3701c6e63581760e8",
".git/objects/fe/bab458581fd36bf61e4c23515f4cb3d572d794": "80c40e62a87c4a6dc3bf64bd34c48a78",
".git/objects/fe/dca623ded14b2dd4d8d26ec209885f50752d4e": "a345ad703f0296d29fcf4fcb4f3f1f8f",
".git/objects/ff/662c704e603f4e6172c1ee19221f85c1b86b0b": "8317b995dd6700fae2dc9c0b138c56e2",
".git/refs/heads/master": "3b1ea0e639c0f04eebad3690c70403ef",
".git/refs/remotes/origin/master": "3b1ea0e639c0f04eebad3690c70403ef",
"assets/AssetManifest.json": "5c0b6edccaefb4afed947a9bc668f2fb",
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
"assets/assets/donation.png": "a08568afb8fb61e0b8e49681e4b5b12d",
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
"assets/FontManifest.json": "d84e8fec324e8f7d3a0e6056f8618392",
"assets/fonts/FutuBk.ttf": "cc84650569fd07dac022c55b20c66e46",
"assets/fonts/heading.otf": "1f55925e52b9e71fd57108874184060d",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/fonts/NeutraTextTF-Book.otf": "9f5cbd54960a1e8784efe6235ab6762a",
"assets/fonts/p1.ttf": "cc84650569fd07dac022c55b20c66e46",
"assets/fonts/p2.ttf": "98d2f97305ab25d4511982e73740922e",
"assets/fonts/quente-script-pen.ttf": "cface0525a4b4cfead1ca69a12f5e839",
"assets/fonts/quotes.ttf": "cface0525a4b4cfead1ca69a12f5e839",
"assets/fonts/SFNSDisplay-Ultralight.otf": "734b5cc7c72aa6a9bf42c77cbfac4b6a",
"assets/images/1star.png": "8fefb866409a7dd772ecbf144e1e47f1",
"assets/images/2star.png": "18dfae09597d9b9e6fcac2a6c179e121",
"assets/images/3star.png": "906fa1b02d4009acb71fc22668bea92d",
"assets/images/4star.png": "dcc4b7fd29ac8ad115a2f2fdb0a45fa0",
"assets/images/5star.png": "1e9013ac0d39eff45bff8bec112cbdfa",
"assets/images/apple.png": "b68406e85c4276ab6028d342c2e1bd0c",
"assets/images/apple1.png": "77ca8b6daef7f3a2c81f8266a17cd96a",
"assets/images/background.png": "616eab6372aec28d33cf62112d316df0",
"assets/images/elie-logo.png": "6ac7060b772595d5c5133d266ce6476b",
"assets/images/footers.png": "e3e1fe9bf0c1d73af6ae6cc614549f77",
"assets/images/google.png": "858326605ef1adb7f91f51bf978423c4",
"assets/images/Intersect.png": "5b8534335b5abb892b0f1f4ae48091ae",
"assets/images/logo.png": "318571102df8734f4bbf653958089ce8",
"assets/images/mascot.jpg": "4c591292cb88a6e2b0178c17bee7d266",
"assets/images/model.png": "776d26e74cad65165ed981a4f4ec788d",
"assets/images/salon.svg": "e97c61347577512f63032718cf32cef1",
"assets/images/spa.svg": "995b3f537b631462b75574f5372257ab",
"assets/images/star.png": "88d52751066d4879496ac525305d5051",
"assets/NOTICES": "e5f99bea7b2eec2da2f02c4a862869bd",
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
"index.html": "f975bfc5376465f8029f2aa44109d0a7",
"/": "f975bfc5376465f8029f2aa44109d0a7",
"main.dart.js": "c758b954b1ce5050e0433d8c9a60d7ff",
"manifest.json": "fbdf04a597dd3dcb38ce98c382a1c3a4",
"version.json": "7882bec0e8516f6893642439ba05bcde"
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
