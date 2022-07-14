FactoryBot.define do
    factory :user do
      email { "John@doe.com" }
      password  { "Doedoe" }
    #   admin { false }
    end
  end