FactoryBot.define do
  factory :review do
    user_id { 1 }
    recruit_id { 1 }
    evaluation { 4.5 }
    content { "素晴らしい職場環境でした。" }
    association :user
    association :recruit
  end
end
