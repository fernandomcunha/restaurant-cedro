FactoryBot.define do
  factory :meadow do
    association :restaurant, factory: :restaurant

    name 'BarFoo'
    price '9.99'
  end
end
