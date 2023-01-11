# 47都道府県一覧
# https://www.pref.hokkaido.lg.jp/link/todofuken/index.html
# Array.from(document.querySelectorAll('ul.linkLists.fourth li span a')).map(a => { return a.innerText }).join(",")
#
# アメリカ50州一覧
# http://www1.odn.ne.jp/haru/data-list/usa50.html
# Array.from(document.querySelectorAll('table tr')).map(tr => {
#   td = tr.querySelectorAll('td'); return [td[0]?.innerText, td[1]?.innerText, td[3]?.innerText, td[4]?.innerText]
# }).map( names => {
#   return `${names[0]}(${names[1]}),${names[2]}(${names[3]})`
# }).join(",")
Country.connection.execute('TRUNCATE TABLE cities')

japan = Country.find_by(name: '日本')
cities = "北海道,青森県,岩手県,宮城県,秋田県,山形県,福島県,茨城県,栃木県,群馬県,埼玉県,千葉県,東京都,神奈川県,新潟県,富山県,石川県,福井県,山梨県,長野県,岐阜県,静岡県,愛知県,三重県,滋賀県,京都府,大阪府,兵庫県,奈良県,和歌山県,鳥取県,島根県,岡山県,広島県,山口県,徳島県,香川県,愛媛県,高知県,福岡県,佐賀県,長崎県,熊本県,大分県,宮崎県,鹿児島県,沖縄県".split(',').map do |city|
  City.new(name: city, country: japan)
end

japan.cities = cities
japan.save!

usa = Country.find_by(name: 'アメリカ合衆国')
cities = "Alabama(アラバマ),Montgomery(モントゴメリ),Alaska(アラスカ),Juneau(ジュノー),Arizona(アリゾナ),Phoenix(フェニックス),Arkansas(アーカンソー),Little Rock(リトルロック),California(カリフォルニア),Sacramento(サクラメント),Colorado(コロラド),Denver(デンバー),Connecticut(コネチカット),Hertford(ハートフォード),Delaware(デラウェア),Dover(ドーバー),Florida(フロリダ),Tallahassee(タラハッシー),Georgia(ジョージア),Atlanta(アトランタ),Hawaii(ハワイ),Honolulu(ホノルル),Idaho(アイダホ),Boise(ボイジー),Illinois(イリノイ),Chicago(シカゴ),Indiana(インディアナ),Indianapolis(インディアナポリス),Iowa(アイオワ),Des Moines(デモイン),Kansas(カンザス),Topeka(トピカ),Kentucky(ケンタッキー),Frankfort(フランクフォート),Louisiana(ルイジアナ),Baton Rouge(バトンルージュ),Maine(メーン),Augusta(オーガスタ),Maryland(メリーランド),Annapolis(アナポリス),Massachusetts(マサチューセッツ),Boston(ボストン),Michigan(ミシガン),Lansing(ランシング),Minnesota(ミネソタ),St. Paul(セントポール),Mississippi(ミシシッピ),Jackson(ジャクソン),Missouri(ミズーリ),Jefferson(ジェファーソン),Montana(モンタナ),Helena(ヘレナ),Nebraska(ネブラスカ),Lincoln(リンカーン),Nevada(ネバダ),Carson City(カーソンシティー),New Hampshire(ニューハンプシャー),Concord(コンコード),New Jersey(ニュージャージー),Trenton(トレントン),New Mexico(ニューメキシコ),Santa Fe(サンタフェ),New York(ニューヨーク),Albany(オールバニ),North Carolina(ノースカロライナ),Releigh(ローリー),North Dakota(ノースダコタ),Bismarck(ビスマーク),Ohio(オハイオ),Columbus(コロンバス),Oklahoma(オクラホマ),Oklahoma City(オクラホマシティー),Oregon(オレゴン),Salem(セーラム),Pennsylvania(ペンシルバニア),Harrisburg(ハリスバーグ),Rhode Island(ロードアイランド),Providence(プロビデンス),South Carolina(サウスカロライナ),Columbia(コロンビア),South Dakota(サウスダコタ),Pierre(ピア),Tennessee(テネシー),Nashville(ナシュビル),Texas(テキサス),Austin(オースチン),Utah(ユタ),Salt Lake City(ソルトレークシティー),Vermont(バーモント),Montpelier(モントピリア),Virginia(バージニア),Richmond(リッチモンド),Washington(ワシントン),Olympia(オリンピア),West Virginia(ウェストバージニア),Charleston(チャールストン),Wisconsin(ウィスコンシン),Madison(マジソン),Wyoming(ワイオミング),Cheyenne(シャイアン)".split(',').map do |city|
  City.new(name: city, country: usa)
end

usa.cities = cities
usa.save!
