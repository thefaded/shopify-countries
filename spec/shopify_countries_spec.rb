# frozen_string_literal: true

RSpec.describe ShopifyCountries do
  it 'has a version number' do
    expect(ShopifyCountries::VERSION).not_to be nil
  end

  describe '.option_list' do
    it 'returns list' do
      expect(described_class.option_list.first).to eq(%w[Afghanistan AF])
    end
  end

  describe '.find_code' do
    context 'when code from country list' do
      it 'returns country' do
        code = 'RU'

        expect(described_class.find_by_code(code)).to include({
                                                                'code' => 'RU',
                                                                'name' => 'Russia'
                                                              })
      end
    end

    context "when code isn't from country list" do
      it 'returns nil' do
        code = 'RUU!!!'

        expect(described_class.find_by_code(code)).to eq(nil)
      end
    end
  end

  describe '.find_by_name' do
    context 'when name from country list' do
      it 'returns country' do
        name = 'Russia'

        expect(described_class.find_by_name(name)).to include({
                                                                'code' => 'RU',
                                                                'name' => 'Russia'
                                                              })
      end
    end

    context "when name isn't from country list" do
      it 'returns nil' do
        name = 'Russias!!!'

        expect(described_class.find_by_name(name)).to eq(nil)
      end
    end
  end
end
