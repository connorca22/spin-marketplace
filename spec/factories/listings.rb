FactoryBot.define do
  factory :listing do
    title { "MyString" }
    artist { "MyString" }
    description { nil }
    condition { 1 }
    genre { 1 }
    price { 1 }
    sold { false }
    user { nil }
    product_type { nil }
  end
end
