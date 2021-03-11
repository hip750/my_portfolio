FactoryBot.define do
  factory :message do
    sequence(:name) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    first_name { "太郎" }
    last_name { "山田" }
    first_name_ruby { "タロウ" }
    last_name_ruby { "ヤマダ" }
    license { "看護師" }
    career { "看護師：５年" }
    postcode { "5420012" }
    city { "大阪市中央区" }
    street { "谷町" }
    phone_number { "0012341234" }
    work_times { "平日:10〜17時" }
    self_promotion { "一生懸命頑張ります。" }
  end
end
