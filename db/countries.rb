countries = %w[
アイスランド共和国
アイルランド
アゼルバイジャン共和国
アメリカ合衆国
アラブ首長国連邦
アルジェリア民主人民共和国
アルゼンチン共和国
アルバニア共和国
アルメニア共和国
アンゴラ共和国
アンティグア・バーブーダ
アンドラ公国
イエメン共和国
グレートブリテン及び北アイルランド連合王国
イスラエル国
イタリア共和国
イラク共和国
イラン・イスラム共和国
インド
インドネシア共和国
ウガンダ共和国
ウクライナ
ウズベキスタン共和国
ウルグアイ東方共和国
エクアドル共和国
エジプト・アラブ共和国
エストニア共和国
エスワティニ王国
エチオピア連邦民主共和国
エリトリア国
エルサルバドル共和国
オーストラリア連邦
オーストリア共和国
オマーン国
オランダ王国
ガーナ共和国
カーボベルデ共和国
ガイアナ共和国
カザフスタン共和国
カタール国
カナダ
ガボン共和国
カメルーン共和国
ガンビア共和国
カンボジア王国
北マケドニア共和国
ギニア共和国
ギニアビサウ共和国
キプロス共和国
ギリシャ共和国
キリバス共和国
キルギス共和国
グアテマラ共和国
クウェート国
グレナダ
クロアチア共和国
ケニア共和国
コートジボワール共和国
コスタリカ共和国
コモロ連合
コロンビア共和国
コンゴ共和国
コンゴ民主共和国
サウジアラビア王国
サモア独立国
サントメ・プリンシペ民主共和国
ザンビア共和国
サンマリノ共和国
シエラレオネ共和国
ジブチ共和国
ジャマイカ
ジョージア
シリア・アラブ共和国
シンガポール共和国
ジンバブエ共和国
スイス連邦
スウェーデン王国
スーダン共和国
スペイン王国
スリナム共和国
スリランカ民主社会主義共和国
スロバキア共和国
スロベニア共和国
セーシェル共和国
赤道ギニア共和国
セネガル共和国
セルビア共和国
セントクリストファー・ネイビス連邦
セントビンセント及びグレナディーン諸島
セントルシア
ソマリア連邦共和国
ソロモン諸島
タイ王国
大韓民国
タジキスタン共和国
チェコ共和国
チャド共和国
中央アフリカ共和国
中華人民共和国
チュニジア共和国
朝鮮民主主義人民共和国
チリ共和国
ツバル
デンマーク王国
ドイツ連邦共和国
トーゴ共和国
ドミニカ共和国
ドミニカ国
トリニダード・トバゴ共和国
トルクメニスタン
トルコ共和国
トンガ王国
ナイジェリア連邦共和国
ナウル共和国
ナミビア共和国
ニカラグア共和国
ニジェール共和国
日本国
ニュージーランド
ネパール連邦民主共和国
ノルウェー王国
バーレーン王国
ハイチ共和国
パキスタン・イスラム共和国
パナマ共和国
バヌアツ共和国
バハマ国
パプアニューギニア独立国
パラオ共和国
パラグアイ共和国
バルバドス
ハンガリー
バングラデシュ人民共和国
東ティモール民主共和国
フィジー共和国
フィリピン共和国
フィンランド共和国
ブータン王国
ブラジル連邦共和国
フランス共和国
ブルガリア共和国
ブルキナファソ
ブルネイ・ダルサラーム国
ブルンジ共和国
ベトナム社会主義共和国
ベナン共和国
ベネズエラ・ボリバル共和国
ベラルーシ共和国
ベリーズ
ペルー共和国
ベルギー王国
ポーランド共和国
ボスニア・ヘルツェゴビナ
ボツワナ共和国
ボリビア多民族国
ポルトガル共和国
ホンジュラス共和国
マーシャル諸島共和国
マダガスカル共和国
マラウイ共和国
マリ共和国
マルタ共和国
マレーシア
ミクロネシア連邦
南スーダン共和国
ミャンマー連邦共和国
メキシコ合衆国
モーリシャス共和国
モーリタニア・イスラム共和国
モザンビーク共和国
モナコ公国
モルディブ共和国
モルドバ共和国
モロッコ王国
モンゴル国
モンテネグロ
ヨルダン・ハシミテ王国
ラオス人民民主共和国
ラトビア共和国
リトアニア共和国
リビア
リヒテンシュタイン公国
リベリア共和国
ルーマニア
ルクセンブルク大公国
レソト王国
レバノン共和国
ロシア連邦
バチカン市国
中華民国]

ActiveRecord::Base.execute('TRUNCATE TABLE countries')

query = <<~QUERY
INSERT INTO countories(name) VALUES #{countries.map {|country| "(#{country})").join(', ')}};
QUERY

ActiveRecord::Base.execute(query)