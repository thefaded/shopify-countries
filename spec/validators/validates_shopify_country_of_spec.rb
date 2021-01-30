# frozen_string_literal: true

RSpec.describe 'ShopifyCountries Validator' do
  context 'default options' do
    class TestClass # rubocop:disable Lint/ConstantDefinitionInBlock
      include ActiveModel::Model

      attr_accessor :country_code

      validates_shopify_country_of :country_code
    end

    context 'when country code is valid' do
      it 'is valid' do
        instance = TestClass.new(country_code: 'GB')

        expect(instance.valid?).to be_truthy
      end
    end

    context 'when country code is invalid' do
      it 'is invalid' do
        instance = TestClass.new(country_code: 'invalid')

        expect(instance.valid?).to be_falsey
      end
    end
  end

  context 'with name option' do
    class TestClass2 # rubocop:disable Lint/ConstantDefinitionInBlock
      include ActiveModel::Model

      attr_accessor :country

      validates_shopify_country_of :country, { find_by: 'name' }
    end

    context 'when country name is valid' do
      it 'is valid' do
        instance = TestClass2.new(country: 'Russia')

        expect(instance.valid?).to be_truthy
      end
    end

    context 'when country name is invalid' do
      it 'is invalid' do
        instance = TestClass2.new(country: 'Russia_Fake')

        expect(instance.valid?).to be_falsey
      end
    end
  end
end
