FactoryBot.define do
  factory :novel do
    title         {"title"}
    application   {"application"}
    content       {"test"}
    association :user

    after(:build) do |novel|
      novel.images.attach(io: File.open('app/assets/images/ailus_logo.png'), filename: 'ailus_logo.png')
    end
  end
end
