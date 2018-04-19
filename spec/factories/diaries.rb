FactoryBot.define do
  factory :diary do
    statement "MyText"
    display_date "MyString"
    association :user, factory: :user
  end
end
