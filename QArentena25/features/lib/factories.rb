require 'faker'
require_relative '../models/users_model'

def sort_id
    user_file = YAML.load_file('features/support/massa/user.yml')
    ids = "#{user_file['ids']}"
    ids = ids.split(",")
    ids = ids[rand(1...ids.length)]
    ids
end

# cria o payload instanciando users (specs_rest.rb) e a classe UsersModel(users_model.rb)
FactoryBot.define do
    factory :user, class: UsersModel do
        id {Faker::Number.number(digits: 2)}
        userName {Faker::Name.name}
        password {Faker::Number.number(digits: 6).to_s}
    end
end