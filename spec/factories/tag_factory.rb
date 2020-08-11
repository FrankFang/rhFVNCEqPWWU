FactoryBot.define do
  factory :tag do
    name { SecureRandom.hex 9 }
    user
  end
end
