FactoryBot.define do
  factory :purchaser_address do
      postal_code     {"000-0000"}
      area_id         {4}
      municipality    {"横浜"}
      number          {"番地1-1"}
      phone_number    {"09022222222"}
      token           {"tok_abcdefghijk00000000000000000"}
      building_name   {"建物名"}
  end
end
