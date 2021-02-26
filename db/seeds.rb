User.create!( name: "Example User",
              email:"example@rails.org",
              password: "foobar",
              password_confirmation: "foobar")

24.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@rails.org"
  password = "password"
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password)
end

25.times do |i|
  Recruit.create!( user_id: User.find(i+1).id,
                    co_name: "クリニック_#{i}",
                    title: "看護師・准看護師 急募！！お好きな時間で働けます",
                    description: "看護師・准看護師を募集しています。経験年数は問いませんので一度ご連絡ください。",
                    pay: "時給:2200円〜",
                    work_style: "9時〜19時の間(3時間〜)",
                    postcode: "1510053",
                    prefecture_code: 13,
                    city: "東京都渋谷区",
                    street: "代々木",
                    phone_number: "0012341234",
                    access: "谷町6丁目駅より徒歩３分",
                    web_site: "https//www.hogehoge-#{i}.foobar.com",
                    transportation: "自動車通勤不可。交通費支給あり。",
                    required_license: "正看護師 or 准看護師")
end
