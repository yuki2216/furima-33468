FactoryBot.define do
  factory :item_order do
    postal_code       {"121-1212"}
    prefecture       {1}
    city             {"奈良市"}
    address          {"紀寺町"}
    phone_number     {"08012341234"}
    building         {"tower"}
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
