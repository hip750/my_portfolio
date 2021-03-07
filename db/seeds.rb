User.create!( name: "Example User",
              email:"example@rails.org",
              password: "foobar",
              password_confirmation: "foobar",
              first_name: "太郎",
              last_name: "山田",
              first_name_ruby: "タロウ",
              last_name_ruby: "ヤマダ",
              gender: "男",
              birthday: "1991-1-1",
              age: "30",
              license: "理学療法士",
              career: "理学療法士7年",
              postcode: "5420012",
              prefecture_code: "大阪府",
              city: "大阪市中央区",
              street: "谷町9丁目",
              phone_number: "09012341234",
              work_times: "平日9時〜17時",
              self_promotion: "頑張りますのでよろしくお願いします。")

24.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@rails.org"
  password = "password"
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password)
end

Recruit.create!(user_id: User.find(1).id,
                co_name: "さくら訪問看護ステーション",
                title: "理学療法士・作業療法士 募集中！1日1件〜OK",
                description: "訪問リハビリの経験がある理学療法士・作業療法士を募集しています。1日の件数は要相談。",
                pay: "時給:2000円〜",
                work_style: "9時〜19時(1件〜)",
                postcode: "5900142",
                prefecture_code: 27,
                city: "堺市南区",
                street: "檜尾",
                phone_number: "0012341234",
                access: "栂・美木多駅より徒歩10分",
                web_site: "https//www.hogehogehoge.foobar.com",
                transportation: "自動車通勤可。駐車場完備。",
                required_license: "理学療法士 or 作業療法士")

Recruit.create!(user_id: User.find(2).id,
                co_name: "つつじ園",
                title: "特養の介護福祉士 募集中！経験者歓迎！",
                description: "介護福祉士を募集しています。性別・経験等問いませんので一度ご連絡ください。",
                pay: "時給:1800円〜",
                work_style: "9時〜19時,夜勤：19時〜9時(半日〜OK)",
                postcode: "5990201",
                prefecture_code: 27,
                city: "阪南市",
                street: "尾崎町",
                phone_number: "0012341234",
                access: "尾崎駅より徒歩15分",
                web_site: "https//www.hogehogehoge.foobar.com",
                transportation: "自動車通勤可。駐車場完備。",
                required_license: "介護福祉士")

20.times do |i|
  Recruit.create!( user_id: User.find(i+2).id,
                  co_name: "クリニック_#{i}",
                  title: "看護師・准看護師 急募！！お好きな時間で働けます",
                  description: "看護師・准看護師を募集しています。経験年数は問いませんので一度ご連絡ください。",
                  pay: "時給:2200円〜",
                  work_style: "9時〜19時の間(3時間〜)",
                  postcode: "1510053",
                  prefecture_code: 13,
                  city: "渋谷区",
                  street: "代々木",
                  phone_number: "0012341234",
                  access: "代々木駅より徒歩３分",
                  web_site: "https//www.hogehoge-#{i}.foobar.com",
                  transportation: "自動車通勤不可。交通費支給あり。",
                  required_license: "正看護師 or 准看護師")
end
