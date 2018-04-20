# coding: utf-8
FactoryBot.define do
  factory :diary do
    statement "MyText"
    display_date "2000.01.01(月)"
    association :user, factory: :user
  end
end
