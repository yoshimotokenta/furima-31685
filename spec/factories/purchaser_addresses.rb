FactoryBot.define do
  factory :address do
      postal_code     {"000-0000"}
      area_id         {4}
      municipality    {"横浜"}
      number          {"番地1-1"}
      phone_number    {00000000000}
  end
end
