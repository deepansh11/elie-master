'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "10e4f1576d2a981d6a05237db9675b7a",
".git/config": "7437e039c26c1c285cb1599503480d8c",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
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
".git/index": "57627610602fbf6c99e47de68a145825",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "deb87e959fe3e9354035315370638b70",
".git/logs/refs/heads/master": "deb87e959fe3e9354035315370638b70",
".git/logs/refs/remotes/origin/master": "53bdbfdad0b36f00c818fb6012871f4a",
".git/objects/00/22caa94d4f6922d5ed8c37a877e731d05e5fcc": "3c89ce6554ae8235101752c9873296d7",
".git/objects/02/bb649b1bc1346bb423cb3aa144af0907780c1d": "06a05d9ba243c48576fced5eb99bdf89",
".git/objects/05/982977cfdd2d031978b84a36adb8d9e3132706": "f8bd6cf270f86f61e21f5c9681cdcc9a",
".git/objects/0d/0df08f7c3e147a8ae36017cf81a96e35b73717": "106e868f28a72727fb6fb0fa71123633",
".git/objects/11/8ec3fa0c3e7632063ee80bb4438521deeb1b3b": "e70779437271c61c131114636a8643f0",
".git/objects/11/ebe0abf0e894a859e0fb58e7eae195cda45183": "a448adc1da0456db701dc50d773d932a",
".git/objects/12/19b5de37166aff5a84418f57c01e426cbe8d08": "94aeb7a927fc530d20ebc1f9750bed74",
".git/objects/14/59f4f4f5f3e0c1a0f78772ad72cb38815adc91": "edbe050c2e9c510bcd91a1c10a752abf",
".git/objects/15/8c4acf0cca357ee36cfd3bfdbc3b72f3ea78d4": "e975b5a1d8ac3b33d5e7799ac7ccfe9e",
".git/objects/16/f84d35f5ac814d4205b5f53cc742cbec8b9673": "383f29a8fbd4a125d7ae567443243e78",
".git/objects/18/aeb2ae7468b5f9edae0ff7da45efd522a6d4d0": "e159707edd8c161661ab8e6c9276a05a",
".git/objects/1c/d589678566b9cf420837d696b733ba764ccdff": "4ad065d56f534a4ae3b0ac97ba10e0a1",
".git/objects/1c/daede23d894be182725c012546c53ae6b74557": "b3997767a81ed8ba590f215867a90dc7",
".git/objects/1d/23469de87ece8d227b8153830c5122bd0e29b8": "81a1869f83163a49a6a82efb29dc017b",
".git/objects/1f/9dea86d49da71f095111707d03b9140eb69733": "0bd4fa0f40267bf0e6d88529e788d60b",
".git/objects/20/0bf5184fd3c584c604c105d9ef8209b8926565": "4c7c7111064b0ec391cd2aeea805492d",
".git/objects/20/9052e8560187aa3ad9e48689acb0832415c05f": "f569e6fda1d771eac84efe166ca19a67",
".git/objects/22/0b101c1c43ec4b033a36fc510cdfcaf3bf2251": "31bb4c4be808bd22c286eb8bced20b5a",
".git/objects/23/daf54d7bc8f88146fcdb698c38b2aff10a9fdc": "d62aa4e52b76ed050e224cbed11135c6",
".git/objects/24/b1f14dd348b07c9b8373758bde9ac14d16fd92": "dbf45d6c044044561758a334420e9569",
".git/objects/25/ff4bb8e13dbca18873abc8dc12d5e5c3edebe8": "585c9c42a0267a30e5f89427e9bf4e73",
".git/objects/26/ac9c49c1725f590f62eff879adebcf76745493": "6bb95bd6407ce3811c3296b38eb63caa",
".git/objects/28/abc991f543724d7300e8e86939b3eb9da91cde": "7e75612a72fb11a9b08d198ab40dbd67",
".git/objects/29/0972dc2826677c89fb0c1f726951581fd22d7f": "8d93cdf47321141577899ea3b9d53b38",
".git/objects/29/2214367c0af9a2eee8f873b2944224e2fe3f0c": "902d6cf3d5ea70392a74bfc9ded583bb",
".git/objects/2a/94b4646ddb7e468764f3b4adb982ad867fea16": "aaaaa7f521ea04596ddafecfc7ee78e0",
".git/objects/2a/e6b749668de3aa9c44c35a1f003c77a9dd4209": "68848e65b46107e2982cb2b4cf96ab93",
".git/objects/2c/547f0485445fe4d048d2686d28010489fcd8b1": "6a801453989ba86351ffa92a3dc7ccaf",
".git/objects/2d/0471ef9f12c9641643e7de6ebf25c440812b41": "d92fd35a211d5e9c566342a07818e99e",
".git/objects/2d/cf3542c874e33cd8ab86ceb6f0ec444228aa78": "66baad0ae5d874f09b6eee790095bc65",
".git/objects/32/55e7d5d44db1375530932340ce4b7961884f05": "a5499497db7bd5b65173a812639c578a",
".git/objects/39/b9777a3aa154e64b531bbc3a629e5c6f88aa24": "f539bbce3060911fb8f30c683919a482",
".git/objects/3c/b3b53a24ee4712b8463133dca203ddd72fb43b": "c3066eae2c84f5465b93f0624f5ecfa6",
".git/objects/3c/eee28d908f250749740981b88ad577f0ea243f": "a06013fad567392ebe0827ae4919cca1",
".git/objects/3d/e2281adca93fc70cdc9ff35d2639e194cc2d76": "9012185509047c4251041b4a8a73e415",
".git/objects/3f/16ebdde227f46a361cae8cf2ff204b5b771da3": "cacba04f05d81d115c5511633a4da713",
".git/objects/3f/9b22a9e57d0ae2731f58c375e70eda60b0e78e": "f1f1d0758d350537c6c7ebfaa2d51cca",
".git/objects/3f/b654f1566b2e20ee7eb5639874513ebc293600": "40fa51c4cd97b4189e4db4005e95ed3e",
".git/objects/40/5253cef5ed302d9e298572786fc05e42ae0be4": "258761bffd9a7e28301e0f05b83161c3",
".git/objects/43/3bb5b3ff570976e27f23e7e5b37d33ed03d296": "6c8fd899a2c2b292cef0b2e25c3586ac",
".git/objects/44/722f63d15445d15fea33ee096ae2e64313a71a": "a703fdc24ea89323b0d1e6068bf74128",
".git/objects/45/59cea21e53c9531d8486aba352e723647d060c": "08df870fc62823d763173ec56d3cd998",
".git/objects/46/bc9491aa7b8ff73b7c7b82e9b03a91a2a362ba": "5407ebc2a390ea01cce7cf904a5a1fbd",
".git/objects/48/66971ab99ddaed608448e28898c2e5ddb1657f": "c8cedf26185886d6b603ab1f4ce371a9",
".git/objects/4b/bc7a2f845a23bf1d067e148f7f3c80ba5c9491": "edb42fe38721751e991ea049ab1fbdef",
".git/objects/4d/495a3f0e873af4155cfbb6605c8fcbf1a0f7ab": "4992e2b2281a66fdb62beec2e2ee05cd",
".git/objects/4e/2e246689aa6eaec4917fea8d1715ed49c87d15": "8741ef0f23f1b0fa065af2410a3eab48",
".git/objects/4e/89617a3696bd10c155ec378f4a65a9f89e9e3a": "d8056e20bae90d092b619c895129e982",
".git/objects/4f/3de3de3fddecd8c4908aa52ac3085ce655f19f": "760d9243c4b5ee0eae788ac37db4b39e",
".git/objects/51/eff3df9fa36a18b4d138e4f7e4089bffd8a564": "48a724ae9507f5cff5c904783011a500",
".git/objects/52/1b89a7768ca5d5c1daff69ba000abdf947dbb1": "016f1e60ae6fab0f385f5fbd79adb666",
".git/objects/54/90eb96d206a01eaa80b1f3710b53ba6bc9c3c6": "dd31250e6bbd29ea1807721a8e3d8a1f",
".git/objects/56/6182b121fe30e5357e0acd95d6b6c9a860980c": "7b7e7bf497874386a9d5f6c71b49f3fa",
".git/objects/57/0ea808cf9c3d8fcec7c15cfc7b300026effcf8": "9f46e87543a9061aca70863611da6d05",
".git/objects/57/e6e4b4ae39dd3a4c973accf6f5b618e2a27635": "a6b7c1c9ffc15c038a87c5f0ed2698cd",
".git/objects/58/6765dd1b2351a5d3baa57bb358f92b00f79f30": "17c4b833140790c28414024b8c755494",
".git/objects/59/6d73b2056daf8d73fe36c5844ffd50a21eeda2": "69d80f6e2f32e218d98b5238e9a3bbd8",
".git/objects/61/f6bd7cb86485f47de52319cf16db9f19189ac8": "4de4caac88340123e99755071ffae6ad",
".git/objects/62/0d0a61449417fca4b18ba51b98edf605ff4ddb": "3e63ebff786bdcc8e3211fc258235835",
".git/objects/65/5a67d9c5e964624e3b5526d39946d1b07ae4e5": "b8f1515e2112f14a4e3adfa02f377bc7",
".git/objects/69/54314460085d4b5f1fb2bd6487d535d9fd4fcd": "4e5cbafa3a26d5cf996cfe3880c37896",
".git/objects/6b/2abd86266ad1089182abce17c92461f0363107": "25f7d9a1dbd555f141ff166d6c0010c6",
".git/objects/6d/c2ac2e7fa17dce22cac5e2dba471bec36d5d35": "0cd1c52324d919dc5f109d5f7b3a99dc",
".git/objects/71/b579783450a16080c2cfeddcf1d3a5762bdd1b": "02392a621834a13c66e42c4164fb67dd",
".git/objects/72/1f9d7713bb12435af658b98ec0917a13ea2891": "4d374694625f630af8ab77e123f88ef9",
".git/objects/73/b3cf73dbd804882466aaaa574fe334e0425405": "03bca42b77a98be432dc59f4ad45ce99",
".git/objects/74/3309ca9ded6d53368b00408996ff64494132ca": "8e8331e458654885077b1ae0bf35e364",
".git/objects/74/592ec85c0a7cf12c516f30a522bc59b37a5938": "e0651060f54dffe2d7bef59b974761c5",
".git/objects/76/8651b2e249c2517c7b37bdbeea0a5d8bfbb707": "495b1c4fefa633f6afe4dc5840ebe18f",
".git/objects/77/1148245f6b62a19e28a666e0301216b58f2f9d": "20adf164fef34b12bc234e36620ddec7",
".git/objects/78/8ca11ef4ab679b1430642392dfd38e457283ec": "08f58eabc55c551ca0898ad53ebd151a",
".git/objects/79/c1dae0b6115a5428f9e629241d4657a549cf6f": "18cdb7c745ab6949806c5e25c9c1f3aa",
".git/objects/7b/2dc66b223d1dcdc3e641ca971c7ffc7c2ade29": "e59a26e91275a867813351da8be95610",
".git/objects/7d/6165e7aaf8e68c431f140e1cb0f5af4dbc0017": "802b5a8939ca0038b70cc799dc9a2ce2",
".git/objects/7f/37fbbc1b1714cff3bc452d16ac31017f678369": "285b41e36e5bd3cc90e3f6919627ae0b",
".git/objects/7f/4c2e921809a572968b1a7385dc267c0c0e1009": "e41c3d7301c6431c49d21e0a11ea5007",
".git/objects/82/a4e34e2a64e0bd88a25d3538cc2b5444a567c2": "b43fb93a283a490e00bd1b51eaedf823",
".git/objects/85/09617edbe1435cc6770b1fc7b7cac860a1da73": "31c7765f00a22507cec7bf2c7a51c4cb",
".git/objects/88/5d975844618c9377272f734d47196ee632f731": "00f74a32300697358213f7e283320ce2",
".git/objects/88/a5796c795b9c62be2e1eac970c0a2d64de3c70": "03ae40777fa5a91486fcd87bee9f75be",
".git/objects/8a/fafde6a649662e31637d54d02d0834a615e7dc": "7bf0843ee42b9cc5d9c6f63909892fec",
".git/objects/8b/ca6b00001681292ecb0a30b082fd557cf47fa1": "8f2253bc242c9b17daa7e3cebdd75a44",
".git/objects/8e/0bb94fdb79b9a57a56c3c8f8631ed5466f5492": "bba748c3b1bb07b1e9a5346d13ab91e6",
".git/objects/8e/91eb3bd06fdf9100d62f7fc6295b6e58565d0c": "bd2e0c617bad483ccdfec45e38f13ac1",
".git/objects/8f/2a0eb351cc3edb1be50b562a77d149bda655d3": "93275110608bd7be9708a0f1b050f801",
".git/objects/8f/3a5864ad67fe5dc8be2031005637688f815e5a": "13539593c5b919a6790f4ca39ffa3d13",
".git/objects/93/2df0a58ce15860c4c5801c66c7895ad56eff07": "3e4190dd3b211bb807e9e03ecaf4170e",
".git/objects/93/555da411c91048ec9231eb1f7a7338e5e59328": "8c686b4614f451ff63ebc1ba05e3d217",
".git/objects/93/a1a9c84ce210a883c47c605b3a5fb8f374bb5e": "db1ec050373a6929e8f0797fa2a235d6",
".git/objects/93/d81f236d42f58c45ad905410309c27efd46daa": "995f44f0e221270eafc012a1f7539c17",
".git/objects/97/1966ac6dbfc125652e845c65e189c9ea2aa729": "04ee18d53bc20299498e6a7276d373d8",
".git/objects/97/2eac878b7fda951f4d08daddbb3ae3a2a98d48": "3b7bc0f11889c7ccd571139603d15b91",
".git/objects/9b/b57b7e7e33c2181bd5d047c09d0f5b50185ec6": "458f20ae42aa6e13fcc229aa6f242c1b",
".git/objects/9c/e9182879d47378b798315d38ad1e478578a136": "351e0124e45751949d4c2da7524ef654",
".git/objects/9e/33d839e21892632e169bd3752491ddb48a788b": "cbef1c42813a69a0c63e44e8b263a1cd",
".git/objects/a1/458aab7d336fb8a7024568f0733b1ebc66a77f": "6d6b34d398bb5622e698e591f94f3127",
".git/objects/a1/5f256c36e926d78f7ced52ac5e5b470a368d5a": "f499c3c20a222ade48d32c3a56ee9b13",
".git/objects/a4/077115272c92280f00798e1a76b21d4dde122b": "a6a666dbf38a4dde9c1966e24c1adca5",
".git/objects/a4/dc91779000e196205ba4688605d51c5030990b": "cbaedc642de4aa83718d12a8b566cad3",
".git/objects/a6/372d23efc71e8bd3e2d1bcfb6a89f18d1e770a": "11fe01b60746c75ec3ab5f153b6732e5",
".git/objects/a6/c7b3a7943414cfa4dae69f13a976360ea1e908": "e095bcf7799fa0f02c8c48274d389084",
".git/objects/a6/ffccd21b8d4f0ea5cb3df21895b0e30af9ef91": "ca1e931151e24b0e51d454fd57d09c35",
".git/objects/a7/4eee2e894d9800aaafdc84c36cddbc3a13c8c0": "ebd2e1a251ceebaefb9bffa6dc8fe5e5",
".git/objects/aa/10a3e408a2b739e61d2a642d3dfad4d14ca112": "4b306034c6a6420fcf964b31da7d5fec",
".git/objects/aa/4a79d4126505054fb6a84cb631b606fb936569": "89a458b9a3fd090a4fb0f68e1a62c62b",
".git/objects/aa/b22f3b15661356ee91b74b155ff797b33edce5": "3cc5928701fd21d4ad936d1ca0c14c60",
".git/objects/ab/efbf3df217edd18f8683423d2d540d78dccb02": "3e097237073b81c0218adf9c5ef8b340",
".git/objects/ac/dff003233d90b91aebe67dcd38d5049aacda7b": "6fea100e06e06948e49143e92be1a8dd",
".git/objects/ac/ecb59fb67eabc62a86038b7339699c5bd66574": "2bee312bdad050832014af9533303f57",
".git/objects/af/4f0eaff4809e4648cd1b0f4231102d072b4519": "b7dd373f9c9976eb8d54f66376336024",
".git/objects/b0/dbe88cbea920ec06ee2419db417dd833987aee": "ae79d291579ad348002f9b8ca8f41ad6",
".git/objects/b1/67fce7d4fdb6aae3c71d8c9b6ee189e0a31d14": "553d7a47a83068bd6486c45cbb38f31d",
".git/objects/b5/0ef7cc413be1772dc67f543eb423732e738c85": "a943035fc1b744ee8ee4a3d99257398d",
".git/objects/bb/a5dc7fa6f3c98525fdb78648d7a939a09085cc": "ab825502ffb661c6b88475d37ed8244a",
".git/objects/bb/b017df8b668bc2e1e36f51d343385d7b92ad10": "67633de59758020b9f3c3e6551dabc10",
".git/objects/bc/e937c1fb76775b89965e7626fecd4e152c3a48": "5d6b565528d9e8690e20a5bc82e2fbdf",
".git/objects/bd/8300de08c291e509d67a4056711a1fe813ad8b": "e445efb8154e70422561b03ec8577f26",
".git/objects/bf/ef9273e5b73e0a7e5a77f182d6fc93ae09a3a3": "d99f702468a94dd88cfd2fec856db35a",
".git/objects/c0/22c82e995ab8d4e64d9bab4efd605fcee1a71d": "b6e09b69d45a3b41ad3252cbe2d51605",
".git/objects/c2/003a49ca16c4985fac2920e343b568f10a1490": "f275fc49372b5e9dee37065122daa01b",
".git/objects/c5/bfdaa579cbebbda48b580abc6b397342651bfc": "ba5025483a947e446614a0667816874b",
".git/objects/c5/e9a8fc293814e51f7b213239045ce09ad8e4f6": "36546f3c8010b59fd7765978e621a4e5",
".git/objects/c5/f1ff10e753d0f3595bce822d2944a003ac4ba3": "4e4bddc69750369e236098e577732899",
".git/objects/c6/d8db1c6847b414ed5cc6478aea044e8efa98aa": "828abbbbd6b8dd51838d6866321d913a",
".git/objects/c7/0bfd3a2a8fa08648305e585c46f7a9ece5a6af": "b29457032a8bbd50548d09249927189f",
".git/objects/cb/48b56dcd79b3ec8ae05438f465bd4a628798f2": "bd2ee6632345b601941ce1b77029ba34",
".git/objects/cc/a9020f1cb5e87be1f937002b618605026e0302": "117d32fec7d7e44c775a8cca93c4460c",
".git/objects/cc/be9d12df99dfe3d50ca39152b94649cca92d8c": "c8a27cccdfd15da1a7429e9fddcae856",
".git/objects/cf/b601e1a097c73077ddfb86a74802a8bc160e2a": "ee7905faf5183ced948bf890b8d8d3be",
".git/objects/d0/03a53106e1ade6309cf2760ecc84a8366cd26b": "474300794b39665fadd6d307c29e5463",
".git/objects/d1/e1b0aec3d2d97d9bfa6289dc9960349b3e8d73": "ab32b29a34cb0fd397d2453d36e24de1",
".git/objects/d4/c1bcb04bafaffd3de97887549912b28f6e4efc": "2dc9286ece8880da871fe893ef673f90",
".git/objects/d5/ae6affd5ce3ed6d9bd8bf63d942dd741636f58": "d53beed28103441f1dd4c1cecb969e16",
".git/objects/d8/8313634674f51073d8a8bf41d4401a859baf3c": "37657ae88f14040011a25073add316b4",
".git/objects/d9/34f571c1ff547e2e998dffe651e0e980d3970b": "8fe714439560481b929a726f7ae5d306",
".git/objects/de/28db843d7df6ed23b8a7526f6b6b4a83425fe7": "797e4f7b3d8dced098c51679ff33e848",
".git/objects/e0/be8f63695800807f74c68d8a99c7b48fdec6e1": "26040687a5e7077cb630294560990d89",
".git/objects/e2/f40db99a618bdce8476abb35bbb21235b0ae71": "dda576a5ae5ba0c7675a91eb984ebebf",
".git/objects/e5/cd7b241fd60f844fe969c743fe2932d1bc6543": "48247d67798ba14c797ede324aa6b067",
".git/objects/e6/a806198e300c295eab268cbffb2f50cb31330c": "2affebd2a730cc8c5fd52a3a74ed1c34",
".git/objects/e9/e575d0b36ebd696294496017834c26b62e1505": "8eca52e53d59927cc7c00a13888ea67b",
".git/objects/f2/3650e74b3b0a36b54a6984d442d7c4121177bb": "b88b725b016a3f11e4534c6ac1384294",
".git/objects/f3/b3efbbd9a930c1613a2fe0cf4fd768030bb13e": "84d6a485ae6e5520fe91473e78ee3dcb",
".git/objects/f4/8f3511d3ccaae27572ecc92758c9ff707e8f58": "7056099c1f69b7fd7d80d9c3f928e7e2",
".git/objects/f6/bb1d0f67127328d57f21e8e9f24cc29b976e2e": "2f2d0bc7f95df92b13bef74d85fc35f3",
".git/objects/f7/533e0c930e56904e24d8cb761a0422be259254": "5f81d3a570e62fb15262633a2318d333",
".git/objects/f7/f31c6e600c6a1942d128ed3ec4fa3bcb4d534e": "a3f1b778b9ac0c292c69bf8e3e4aab3c",
".git/objects/fb/2526cbeda30789870cfc1db1af4a077c3176c1": "c2cbeb816167c37d5dd64bfa6f7c0291",
".git/objects/fc/3bf3283a79089f6bfed838532ebc4e504a4336": "d28d8555e5bc6cc0699e6adea3f39783",
".git/objects/fd/813c79ead5b18d02bf48e27df84ca1777e23bc": "94c3a16ff663234819e2277881c94072",
".git/objects/fd/cd8af7534cf465e646ea57f8b081e0a61101b3": "ab06da4c1d2d9ffb31080a71278fa367",
".git/objects/fd/ffb47c9ed8d186c21ca0124cc579dcf49eeaec": "4483efe380f1524ef6429c870af40971",
".git/objects/fe/1302acea02d6a1c6447cc2d7e79c61386727d9": "e461083a213064d3701c6e63581760e8",
".git/objects/fe/95da242be38754d039320e34f84e6f020fd1f3": "6efc08cac92cc8fecf1fa6d2213274f4",
".git/objects/fe/dca623ded14b2dd4d8d26ec209885f50752d4e": "a345ad703f0296d29fcf4fcb4f3f1f8f",
".git/refs/heads/master": "18a98539eca5efc564e3017887bdba26",
".git/refs/remotes/origin/master": "18a98539eca5efc564e3017887bdba26",
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
"assets/images/background.png": "9646eba0f8dd40c2846e9ff91dfa280b",
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
"index.html": "8bfa13e1bfb326da6fe8f4a7e0f08bdb",
"/": "8bfa13e1bfb326da6fe8f4a7e0f08bdb",
"main.dart.js": "d866aafb01f1f8648ffcd5829cd925b4",
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
