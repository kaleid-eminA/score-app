FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { '123456789asdfghjkl' }
    password_confirmation { password }
    
  end
end
