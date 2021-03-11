FactoryBot.define do
  factory :recruit do
    user_id { 1 }
    co_name { "クリニック" }
    title { "看護師急募" }
    description { "駅近のクリニックです。" }
    pay { "時給:2000円" }
    work_style { "9時〜19時(3時間〜)" }
    postcode { "5420012" }
    city { "大阪市中央区" }
    street { "谷町" }
    phone_number { "0012341234" }
    access { "谷町6丁目駅より徒歩３分" }
    web_site { "https//www.hogehoge.foobar.com" }
    transportation { "自動車通勤可。駐車場完備。" }
    required_license { "正看護師 or 准看護師" }
    association :user

    trait :recruit_2 do
      co_name { "クリニック2" }
      description { "フレンドリーなクリニックです。" }
      created_at { 1.day.ago }
    end

    trait :recruit_3 do
      co_name { "クリニック3" }
      description { "ユニークなクリニックです。" }
      created_at { 2.days.ago }
    end

    trait :recruit_4 do
      co_name { "クリニック4" }
      description { "エレガントなクリニックです。" }
      created_at { Time.zone.now }
    end
  end
end
