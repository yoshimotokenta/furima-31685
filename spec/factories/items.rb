FactoryBot.define do
  factory :item do
    name                {"test"}
    info                {"詳細"}
    category_id         {3}
    condition_id        {4}
    area_id             {4}
    estimated_id        {2}
    seller_id           {3}
    price               {1000}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
