module CustomValidatorHelper
  def build_mock(attr_name , validator: )
    raise ArgumentError if attr_name.blank? || validator.blank?

    Struct.new(attr_name) do
      include ActiveModel::Validations

      def self.name
        'DummyModel'
      end

      validates attr_name, validator => true
    end
  end
end

RSpec.configure do |config|
  config.include CustomValidatorHelper, type: :model
end