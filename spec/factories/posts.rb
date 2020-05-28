FactoryBot.define do
  factory :post do
    title {"hello!"}
    content {"world!"}
    image {"hoge.png"}
    area {"大阪市内"}
    rank {"高"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    post
  end
end