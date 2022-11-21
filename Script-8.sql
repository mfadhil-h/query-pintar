--update "transaction"  
--set
--	final_trx_status = '201'
--where 
--tracecode in (
--'69d2df6bf63044248bff907647c8496a','d49f01c154314b398778a7f376fa42cc','e5cb5b8fa37b43799d03f2ed41c7e29d','5cb48889684a475c9b6bdcd6f443d005',
--'975bf36459a243f3a56875ad3e89952c','3080583f3fed4a559536fdff03f2cfde','008f74b5927c45c5afa847fedec617c2','3acbd6f67d834858ade21fdefcd49f86',
--'e6433446bbc340ad91665e29cca0d90a','3281efaa2e0149f9be0784d5827a7dd2','f3856220ceb048eab46ba60a5519d9b3','83f7969d09144d5e86ee04b4864d8cf5',
--'5cfb3b0409b243e98d24f3efd98a130e','731c2994e4bb44fd98a95c227d75c4ff','23d7156e241140c39b9f120e52d69f25','bd726d042b8f43a3895127f6c013a6f2',
--'8dc8dea0009a4694b7e93f789b6870b0','b26daea9c1f34c668e30862865082ab6','49e299a0c28f4ce2b631d5666cbd8d9b','e599aedbcd6b42dda7db7150cc2a32ed',
--'4401cb264abd415b9bd709a0e4f18c97','bd9c637b77ad426f99792f89090a0e08','c40b67e327534bec89911d7395f2e19f','80e828f8a86d4b4b8e6e50b9e48f4347',
--'27bc71c446474408869879c6bbb326be','fd92964e6df84191807513361e53c119','7c48b070c98147e09d415ff208705580','565ee9ddc34a48e7b114929e26a1cfc4',
--'624b7f0505564d789c0a7f75e6c3bcf0','ca5d43f9ff8f43f4a7631adbbdbadd81','122f297d0b574cc9a32eeb827436d8fa','85cd145b08f447238eca9c0ba3a0f928',
--'76ef240d23d74aaab83978c5911ba25e','31b13f59dca2425d8c89e49f4803f300','5073beb07acf420183bc7f37d07a945c','41347302fe914d13ba7ba0a70c1df39d',
--'6dc41a2a37874490beccc361ca3e740a','849fce390855464fae2e4ed549ab1ac3','ce8d07eec85b455ca1e00112e4e18ae5','1319562064f745199599d4a9aa75b1c9',
--'618dfb3857904c5cb13add97ff4129f3','acb1d47892184832aa74889828440128','395aaea9ee0844818ef8fd1cebb781e3','a0920224561e4b5582ef6e1f31254f57',
--'3eabc27275a642a59436666ba44f58bb','9cc9b8803e7944e6b29469d5fa8aa053','adf8701860e24ad7a2a5f22591309b43','d981d9e082ea47bd96c009218c5f0b24',
--'3dc012d859d1455581ea72f3ad72d2eb','99c0e54dc2764a7fadccef5a839a649d','641c8661afd5474f86cb2ddda83be374','cc7c6dee9c29412cb8abd86ce135075f',
--'e0f9f0ad555e4cda8b30e099dfcb364a','a4d9f6060d974eb1aebfa0a2b309bf57','9d015bb18ad14be989a1575670b0540b','4bb9af4481bc4be79ac6ecc7fbdda855',
--'21c1081938064542adc668991bedccea','ef99a856deed4e039c0c00dd569c18c3','d9814276606647e39cf361939693d46c','5c520807288c448abad67d170ffa3347',
--'b4bf48d5f67a4757b0e8ea623153996c','2f846a8071ed490aa713c580a6928af6','8b078b0ff1c44f228f18d18f8af1c761','26c29517684548aeb7b2a8f8b757490e',
--'9c4bcd134e214c97a9dd705965b39b74','c1c16bfb1dec430ba26c2010f0fdfe18','4f1b5bb5eaa04dfda530fb9b832ffa14','8c378eb2913e4f8fb69fcbedf132b923',
--'03d227501ddf4f35a3415d09d301033c','23af3b559e834bc3ad08a7776b16c8c1','773c4f59ed0749eba9e7c1ebec085381','ca0c35b1e4944b35a40cfdd7e0705c6f',
--'65f8ae1cfede4ded953191c0d57ef4a3','5d25581ad5384df8893ceba0e51f15e4','133dd3a29ae24713bfad52266f9f8cc8','3a04eeb43b0a4cfb81ee302b88118ede',
--'9b307acde8c2457a99fa5fbfcb3b8445','e373bf3e836e42feb13ba404409c6174','0432545986d24f2a8bb3fc5c944934df','f0ec5466cef84774adc7ccc2c664ef33',
--'a77d5d6734ad42f18e30367bdae7202f','9357f63385e146fba956a21c00bb7b22','64473b0400604f40b9726c5ba83f5b63','66a2f491d7db477580402c06e3a73f72',
--'79cc7f49c31a43efa9ad13cfd2061bf1','8e6d14d136ba4f2fae40c353c773fb48','08116da3112846719ebd0442dea4d950','ed5534ed2dfc486ca0d3c4ce79ec0b41',
--'e5d139b23f674e648fd6f811bacaca56','1a266b9026cb4b9e9dde0eb3c19a0f0f','321f9312ce6742fa845081e50ca57f8c','9342e82c5c034223ad6aeaae66515bf3');

select * from "transaction" t
where 
tracecode  in (
'69d2df6bf63044248bff907647c8496a','d49f01c154314b398778a7f376fa42cc','e5cb5b8fa37b43799d03f2ed41c7e29d','5cb48889684a475c9b6bdcd6f443d005',
'975bf36459a243f3a56875ad3e89952c','3080583f3fed4a559536fdff03f2cfde','008f74b5927c45c5afa847fedec617c2','3acbd6f67d834858ade21fdefcd49f86',
'e6433446bbc340ad91665e29cca0d90a','3281efaa2e0149f9be0784d5827a7dd2','f3856220ceb048eab46ba60a5519d9b3','83f7969d09144d5e86ee04b4864d8cf5',
'5cfb3b0409b243e98d24f3efd98a130e','731c2994e4bb44fd98a95c227d75c4ff','23d7156e241140c39b9f120e52d69f25','bd726d042b8f43a3895127f6c013a6f2',
'8dc8dea0009a4694b7e93f789b6870b0','b26daea9c1f34c668e30862865082ab6','49e299a0c28f4ce2b631d5666cbd8d9b','e599aedbcd6b42dda7db7150cc2a32ed',
'4401cb264abd415b9bd709a0e4f18c97','bd9c637b77ad426f99792f89090a0e08','c40b67e327534bec89911d7395f2e19f','80e828f8a86d4b4b8e6e50b9e48f4347',
'27bc71c446474408869879c6bbb326be','fd92964e6df84191807513361e53c119','7c48b070c98147e09d415ff208705580','565ee9ddc34a48e7b114929e26a1cfc4',
'624b7f0505564d789c0a7f75e6c3bcf0','ca5d43f9ff8f43f4a7631adbbdbadd81','122f297d0b574cc9a32eeb827436d8fa','85cd145b08f447238eca9c0ba3a0f928',
'76ef240d23d74aaab83978c5911ba25e','31b13f59dca2425d8c89e49f4803f300','5073beb07acf420183bc7f37d07a945c','41347302fe914d13ba7ba0a70c1df39d',
'6dc41a2a37874490beccc361ca3e740a','849fce390855464fae2e4ed549ab1ac3','ce8d07eec85b455ca1e00112e4e18ae5','1319562064f745199599d4a9aa75b1c9',
'618dfb3857904c5cb13add97ff4129f3','acb1d47892184832aa74889828440128','395aaea9ee0844818ef8fd1cebb781e3','a0920224561e4b5582ef6e1f31254f57',
'3eabc27275a642a59436666ba44f58bb','9cc9b8803e7944e6b29469d5fa8aa053','adf8701860e24ad7a2a5f22591309b43','d981d9e082ea47bd96c009218c5f0b24',
'3dc012d859d1455581ea72f3ad72d2eb','99c0e54dc2764a7fadccef5a839a649d','641c8661afd5474f86cb2ddda83be374','cc7c6dee9c29412cb8abd86ce135075f',
'e0f9f0ad555e4cda8b30e099dfcb364a','a4d9f6060d974eb1aebfa0a2b309bf57','9d015bb18ad14be989a1575670b0540b','4bb9af4481bc4be79ac6ecc7fbdda855',
'21c1081938064542adc668991bedccea','ef99a856deed4e039c0c00dd569c18c3','d9814276606647e39cf361939693d46c','5c520807288c448abad67d170ffa3347',
'b4bf48d5f67a4757b0e8ea623153996c','2f846a8071ed490aa713c580a6928af6','8b078b0ff1c44f228f18d18f8af1c761','26c29517684548aeb7b2a8f8b757490e',
'9c4bcd134e214c97a9dd705965b39b74','c1c16bfb1dec430ba26c2010f0fdfe18','4f1b5bb5eaa04dfda530fb9b832ffa14','8c378eb2913e4f8fb69fcbedf132b923',
'03d227501ddf4f35a3415d09d301033c','23af3b559e834bc3ad08a7776b16c8c1','773c4f59ed0749eba9e7c1ebec085381','ca0c35b1e4944b35a40cfdd7e0705c6f',
'65f8ae1cfede4ded953191c0d57ef4a3','5d25581ad5384df8893ceba0e51f15e4','133dd3a29ae24713bfad52266f9f8cc8','3a04eeb43b0a4cfb81ee302b88118ede',
'9b307acde8c2457a99fa5fbfcb3b8445','e373bf3e836e42feb13ba404409c6174','0432545986d24f2a8bb3fc5c944934df','f0ec5466cef84774adc7ccc2c664ef33',
'a77d5d6734ad42f18e30367bdae7202f','9357f63385e146fba956a21c00bb7b22','64473b0400604f40b9726c5ba83f5b63','66a2f491d7db477580402c06e3a73f72',
'79cc7f49c31a43efa9ad13cfd2061bf1','8e6d14d136ba4f2fae40c353c773fb48','08116da3112846719ebd0442dea4d950','ed5534ed2dfc486ca0d3c4ce79ec0b41',
'e5d139b23f674e648fd6f811bacaca56','1a266b9026cb4b9e9dde0eb3c19a0f0f','321f9312ce6742fa845081e50ca57f8c','9342e82c5c034223ad6aeaae66515bf3');