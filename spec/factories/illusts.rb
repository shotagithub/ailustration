FactoryBot.define do
  factory :illust do
    title         {"title"}
    description   {"description"}
    application   {"application"}

    association :user

    after(:build) do |illust|
      illust.images.attach(io: File.open('app/assets/images/ailus_logo.png'), filename: 'ailus_logo.png')
    end
  end
end
