select t.tracecode, t.trx_datetime, t.final_trx_status, t.acc_number_01, pi2.accnumber2 
from "transaction" t 
left join postpaid_inquiry pi2 on t.tracecode = pi2.tracecode 
where 
(pi2.accnumber2 != null or pi2.accnumber2 != '') and
--t.final_trx_status = '000' and
--t.client_id = 'ARRA20210531102137' and
t.client_id = 'DA0120211216231202' and
--t.trx_datetime between '2022-09-30' and '2022-10-31'
t.trx_datetime >= '2022-11-14 00:00:00'
order by t.trx_datetime desc;

select *
from transaction_balance tb 
left join transaction_receiver tr on tb.tracecode = tr.tracecode 
left join "transaction" t on t.tracecode = tb.tracecode 
where 
date_time >= '2021-01-01' and date_time <= '2021-12-31' and after_balance < 0
and tr.data_type = 'JSON'
and t.product_code != 'ASRBPJSKES'
order by date_time desc;

select tr.tracecode, tr.receiver_datetime, tr.request_body, tr.response_body 
from "transaction" t 
left join transaction_receiver tr on tr.tracecode = t.tracecode 
where 
t.client_id = 'ATON20220906192532'
order by tr.receiver_datetime desc;


--UPdate by tracecode 
update "transaction" ts 
set final_trx_status = '201'
where ts.tracecode in (
'61e9c9ea6a37483f984031bd8481588f','db1b6f19457e43eb847c7f38dd3388e1','d21795c027fa4b0da7289ae0d63e4671','4364259ad27c43c38ecf0feb0826c21b','4bee4bf0b4b64439a3d3b4c7411d501d','4b2f760fb52f4ee985abf2df06427383','022b3f217a2a4eb790c8699324543755','c255e23f0e9448dd9cead4ad3b36066d','b240381f4f9941e7a7d2d37d563410d7','932b7544dbc54cd1be195be09059b03a','d4917f495c934dabaebcf118b62869d1','8d372e3013604c3a8bbb9ead003c2966','6ceb62dfe7df496296110a0c0395152e','4955fcba02904235a941b93815298c3d','a4753ee308974edaafb867b8ff0688b1','a43bf4de41704640b04f1af62c6032ed','9dc0a65b6f8643168296f2ce17bb3c5d','661becfca5df4e65b4b953d1a2e920ae','11c38662971446ecbe6dd1d81ee52650','a39fdd9dcb784aeca23a3311fac1cc5a','86da253df8454504bf272f938886101a','09bfa2dfe84d4cbdb84bdbb56ecdaa7f','72c6f7230e8846a9a349961a4a4592bc','cf87c5268def4c649428239a0a4f3fb2','8f04ef010561473c89f316fb1a488167','9ecfcd608cdd41a69a53ce5ead2daae1','0dc521d9ce3d42f5a8c95de6aa87f1c2','0cfc972610e3430283ff2a226dee88dc','1fc1299567974622898615f19300a36c','6eb07c425ace422e9eb34c438040a249','b48a9368be014de4a94668ddd09b2a5b','6f07fc06cebe4dd1a3bd8a71d795ac14','5953ed59467c4659abde16291c4e8c18','52b0a7a4dc644ab48233ef96f2635439','dc11c49c1c6a4158bf556ed739fa29ce','6365746b18f94658ad3b76fa6248799e','497a8aacb719475e8fe172ed441da077','632605388d3d47b6aa40cff3e113c57a'
);

--select by tracecode 
select *
from "transaction" t 
where t.tracecode in (
'61e9c9ea6a37483f984031bd8481588f','db1b6f19457e43eb847c7f38dd3388e1','d21795c027fa4b0da7289ae0d63e4671','4364259ad27c43c38ecf0feb0826c21b','4bee4bf0b4b64439a3d3b4c7411d501d','4b2f760fb52f4ee985abf2df06427383','022b3f217a2a4eb790c8699324543755','c255e23f0e9448dd9cead4ad3b36066d','b240381f4f9941e7a7d2d37d563410d7','932b7544dbc54cd1be195be09059b03a','d4917f495c934dabaebcf118b62869d1','8d372e3013604c3a8bbb9ead003c2966','6ceb62dfe7df496296110a0c0395152e','4955fcba02904235a941b93815298c3d','a4753ee308974edaafb867b8ff0688b1','a43bf4de41704640b04f1af62c6032ed','9dc0a65b6f8643168296f2ce17bb3c5d','661becfca5df4e65b4b953d1a2e920ae','11c38662971446ecbe6dd1d81ee52650','a39fdd9dcb784aeca23a3311fac1cc5a','86da253df8454504bf272f938886101a','09bfa2dfe84d4cbdb84bdbb56ecdaa7f','72c6f7230e8846a9a349961a4a4592bc','cf87c5268def4c649428239a0a4f3fb2','8f04ef010561473c89f316fb1a488167','9ecfcd608cdd41a69a53ce5ead2daae1','0dc521d9ce3d42f5a8c95de6aa87f1c2','0cfc972610e3430283ff2a226dee88dc','1fc1299567974622898615f19300a36c','6eb07c425ace422e9eb34c438040a249','b48a9368be014de4a94668ddd09b2a5b','6f07fc06cebe4dd1a3bd8a71d795ac14','5953ed59467c4659abde16291c4e8c18','52b0a7a4dc644ab48233ef96f2635439','dc11c49c1c6a4158bf556ed739fa29ce','6365746b18f94658ad3b76fa6248799e','497a8aacb719475e8fe172ed441da077','632605388d3d47b6aa40cff3e113c57a'
);

--select transaction_receiver by tracecode
select * 
from transaction_receiver tr 
where tr.tracecode in (
'e84b686d2fe14df281eb1bf97a5c2a55','98f29d239fcd48c4a553d37d4c7738d7','5dce114e12eb4447a3c52fff835f01a3','1601258464f84482b229de6e2808301b','d3931d9bdef44906a5b6395d77da381d','b9a6a2e4110c4d40b3e0aa0e5be3b00c','c4c41a14ecd844a489c90f2413f0c770','730b2939634f4c0b80d94e88b0578809','d42fd6b1145048f1b6de010a8c1bc49a','c65da85d5ffb42559793543fac9f3d7f','485d50a4737542de9c2f78600fcbfbb2','bad2d298d6c444e19466d36758658f51','5dbbbf88253247bbb605850707b05d82','fba5d56697a4495ea712c810dec1f7b1','a3de30dc91f148308fd1a6bcb7d365f4','07198cc98b544f0291ff9c5af44499a9','13e41f6b35254690b84ee813d2651a81','ff228457758d4db69270d53ef84beece','d06f35a9bd2e4b35b79e9b595b306b00','ca8b403f07f74fa092da046f653ae17e','48d3b0ce230340ccbd045f801e7ceee4','5fefbf3a69664631997031bf1c45a396','850994bb926b4c779330162f828f9cb1','8035a830ee19445691931c05cae39d1f','4d79f68cbb53441faa017ee56a9070f0','4221b80d746f423294cd3cb565fc8ead','058d3603d5ec4965890f6b0a200ed57b','d69dd7634bf8432da246ce100f697d12','fb4ea67a3fa84815a59360a2f1b6ee70','bcad07c454fa4611988eed6ff1d8e4e4','5218d881ce8443439ba4b9e0f8ef03c6','0797a0f9226441dcbf79eee063836f7b','b01e86aa719c4740b0bcbbf77aab3b1e','6bf144bd66a142d1be36e417953bb41c','4c059fe10db144efbf62ee2220d67841','d4d5fd47416b439f8bea7ed2aa991361','4278fa29491b45ecae701068d2f44a4a','3d97168d84b74188a810fc969aded36a','79ad23a181104e349d2a8c477067cda8','a688a831276e4f59add823009a5612de','da5b89d907584bc2b9825ae83c6c9f03','77f168ca215243aeb1ead72512d7ebf7','9f872bd08f0a408cafe38adff8fc3d7f','b15163a1ee3f471ea0876350e0ad202c','d5be660a83034bb192eccd25b061922e','90ce48c4fa254b5ea875ec3b001d837b','f5f88a3c74f14b1d8de21b9b36c25fa7','395ac159d0d94f308980df88db6b0c46','9a4eb1f3c49c417abb94d72b77519165','583864bfe8684e63bd99d3f9bcdb45ce','53a6562928344f75a374664608859025','cfac455ae7d44c9eb723f0dca4b55c97','1b1f3cd200ec412da2c9790ce6ec4ab4','d1433841b8c7409e9f3fe00ef08e16b9','8f4740e2459a4b2ca035a944de278616','7015a14a1f3441e58d1789390c154082','a54db8c6604e462688ae48191e8c034e','ff2cc7175e884c418c4788f6f2d23fa2','f6c341cd6c5b49c580828797e53fdf0f','1f8346a222af471f87eedf190dfd99bb','ba17dbcaae434b0aa1bc9e26e9b24a99','90386b384c7f43a6a36a17eacb8b0a12','9799588e74a845488325b02cccd50922','b73ae94846ca4b63aaa6438bb005ff00','0c787986182f4aaaa1ca826dd79b36f7','46031537808040b08612a1349b939bcf','ceb6e231e0624f01b61fcbaf730c3467','916a6967c3e24ea699f6375b5b7d98ce','0767b2794cec46b2ba8fb25f245a409d','587e8bf3b99a47adbdbd0e1660abaa45','ea93b46bcd4e4966b161cca2dca75b27','d1fb651fe4c94bf7af0231c1b16a8adf','5a072472f9c94bf696b045d4486c2558','128fc51fbbaa46bba4ad743e1fec4639','51de2756c13a47cd8eaf3c9e2b96873c','9a42f7681c5742d5bd68e5fa65ae79b2','52baf2cca40547dda28aa80fcd1f0f8e','d2f981a024284e978c4c64e00a9d0fab','25dddf53c63a44b29c17dca0c3486e55','db32cf02f4bb4047a138a3283b384404','ce924519a8304de79210a1b329ad52a1','38d81df37cf640edb0bbbe81a074deac','bf4a9982f5a24e15ae0daf5057a98326','1bd6c9676575483f8b121d5dbd11a495','0f0c3463181a43f3b53e7be7231492fe','399054981327459abdcff21ec400cf64','e7e894c6963a4466afc0ddef5e7ffc6f','ef74d4131dca495db306ba47b99c9587','4d3688c93bc24fe09d22149878758932','3ae7c0353b6840a78c38b09f3e38e744','4c93e526933c4e8f96706ca38048ef0e','76f5a4e217694778915ebf7a14d2714e','0af008b1c21a4845b80334ec64a722fd','402d2a8818114c8582e46e2ad016cf75','405d5b125e1a4bc793f1645edea8a5c6','542ed534e3164838ad20744c4996cc33','3f3f2185959c4144af30c2dd012f1749','003e745013bc47dcb91ad76ed4c10827','98ae7593254c45b6b4ed68f3aaf1fcec','dbc63e0fa16d4e4dae17ee7980afb3f8','a8da0c640e3340ebbe12d1531d75f4e3','c4474a6591a84171ba93eb4522646fa5','c6b3ec73514f4bb1bc0290afa1c5a56a','4dc3a8b03e304af38c390bc2101c7aca','5ca87faea0234db4b17c2c9f5fe3805a','5f70cbe0145849ac86161603a9e9cd68','d0122da7eb50431097303ac61eca0d5e','49b5975d1ef546aba67492366b95027f','89123e7c3a544d678f214835900ccdb2','29a20d62d49e4ab5865fb934a535ff7b','83d4f2d417784d4188d05ec9406d3912','737c939dfe1144ababff200f31ab5658','498a07fad90e49d88ca3e27124f3c947','b0633e5d56224dff8354332a2a56bf10','6325ecb2d0dc42d88fc8b8a368586514','bc49341b78c94be3acdb19e57478ff75','e26d8560bd6a4c7bb9447d97e2766f7e','45b35a9ca88c49c487b579dc74bf2483','9aad59649d84402eaef86ceb57ea10cc','661b22b9415d497a99c5aeb6bf938887','5f71b4bd017b437fbf385d80e095f9f2','f4195e0ebe6f4834b09f36f3125a7b61','04d20e97b7ea435c9786969481d4aca7','73494ca2f5104d05ba259dcc3d1b5941','09dfb140bbd247f087c5a3c55b73f427','87a585d7770f4f7a8dffa85d983cff9f','5fe18865846944349b540b4277dcc6d0','9b934ec9b2f04e9eb3503337b8388fdd','f720df1cf039431dbeddacd7cf94b292','4aae0df333f646e7a693635df03222b2','aa3c921eb61b40499c8b01758dbe5c2e','4e90182b08934b268c415be2fd64763f','535994d46f924cb4ba452a7180997ed9','18f9e0a3955f4f908e330f8e00f54370','976931cd24a34771a596639336d7848a','13061b67957d47b79b9e8533f5693451','0eeeee6a0e34479dbd5393375a64bb0c','8077a7efc25744b08d3b90cf8dac1074','d47c85ad4fe44249a6bc1b8ab7422258','644cb41ddc9f4ae5a00667406ed135f9','b2bc6c5882164bb2bd2b7696bf42aced','517f4a052d734f6098acf1dade2aa018','ef4d1863a7ee495590f430f3f5d5d245','e07dca74511a4f46ae5f35d88690f554','6abe1094e66f4709a8f8c48b03db3ed2','e860388cce084e12bd6c43470d348f78','a6d6d71efe934ec0968f67d2229039a3','41ffa89c505e4d3a92e09cebd80a20f5','32673fab2ebb440fa073ea65734c4fc3','842b26d96879468da7a5bcb4fab55011','5da28b99ff274dbfbd9149e5e09e1abe','a4b3187522f14d3ca1572bb4f681ca23','878d4800e7a24ce6b687520e63853527','7abd02f1aa214550b8f9427865fbea4c','c14a5f72965a45158e2a5797e6369623'
)

select *
from postpaid_inquiry pi2 
where pi2.tracecode  in (
'4c71ab2b5f4046d2a1a59ced37f46592','daba5b4c00a74a5697cacb7f42501246'
);


select tr.remote_ip_address, tr.receiver_datetime, tr.request_body, tr.response_datetime, tr.response_body
from transaction_receiver tr 
where remote_ip_address = '222.229.87.221'
and receiver_datetime >= '2022-11-17 00:00:00'
--and receiver_datetime < '2022-11-16 00:00:00'
order by receiver_datetime desc

select *
from transaction_receiver tr 
where remote_ip_address = '222.229.87.221'
and receiver_datetime >= '2022-11-12 00:00:00'
and receiver_datetime < '2022-11-16 00:00:00'
order by receiver_datetime desc;

select *
from transaction_receiver tr 
left join "transaction" t on t.tracecode = tr.
where user_id = 'danamon'
and receiver_datetime >= '2022-11-12 00:00:00'
and receiver_datetime < '2022-11-16 00:00:00'
order by receiver_datetime desc;

select *
from "transaction" t 
where t.tracecode in ('ff807d3634a2472684f4f1ab9ce1feb2');
--('59314e35bed84064b9e90a65a7e67bb8','eca247a3491447aea94f312855fb131c');
--where t.client_id = 'AAY20030603311'
--order by t.trx_datetime desc limit 10;47b28b1480c','e73ad04bef7748cfae3e8ce3ae54333a','ad117a8ad475485bb6e22a2f5180e190');

select *
from transaction_callback tc 
where tc.tracecode in ('59314e35bed84064b9e90a65a7e67bb8','eca247a3491447aea94f312855fb131c');

select *
from transaction_vendor tv 
where tv.tracecode in ('59314e35bed84064b9e90a65a7e67bb8','eca247a3491447aea94f312855fb131c');
--where tv.vendor_id  = 'FAAY201124'
--and tv.vendor_hit_datetime >= '2022-10-17';

select client_name, bm.*
from client c 
left join bpjs_mitra bm ON bm.client_id = c.client_id 
where upper(c.client_name) similar to '%(ARTHASERA|BIMASAKTI|ASTRAPAY|AYOPOP|NOBU|DANAMON|INDOTAMA|JALAMETA|LOKET|MCASH|RAYCARE|SEPULSA|TRADEZIA)%';

select * from report_request_transaction_sms rrts 
where rrts.request_datetime in ('2023-01-05 11:02:13','2023-01-05 11:02:49')