FactoryBot.define do
  factory :product do
    title         {"title"}
    description   {"description"}
    application   {"application"}
    price       {1000}
    association :user
  
    after(:build) do |product|
      product.images.attach(io: File.open('app/assets/images/ailus_logo.png'), filename: 'ailus_logo.png')
      product.file.attach(io: File.open('public/images/test.zip'), filename: 'test.zip')
    end
  end
end
