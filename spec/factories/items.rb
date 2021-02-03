FactoryBot.define do
  factory :item do
    title              {"商品名"}
    description        {"説明文"}
    category_id        {1}
    condition_id       {1}
    shipping_user_id   {1}
    shipping_area_id   {1}
    shipping_day_id    {1}
    price              {300}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/lemon01.png'), filename: 'test_image.png')
    end
  end
end
