FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials }
    email                   { Faker::Internet.free_email }
    password                { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation   { password }
    last_name               { '田中' }
    first_name              { '太郎' }
    last_name_ruby          { 'タナカ' }
    first_name_ruby         { 'タロウ' }
    birth                   { 19990909 }
    prefecture              { '神奈川県' }
    municipality            { '横浜市' }
    address                 { '1-1-1' }
    building                { 'メゾン・ド・テスト' }
  end
end
