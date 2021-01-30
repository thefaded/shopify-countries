# frozen_string_literal: true

require 'shopify_countries/version'
require 'active_record'
require 'shopify_countries/validators/validates_shopify_country_of'
require 'json'

module ShopifyCountries
  COUNTRY_DATA_FILE_NAME = 'countries_data'

  class << self
    # Find country by name
    def find_by_name(name)
      countries.find { |country| country['name'] == name }
    end

    # FInd country by code
    def find_by_code(code)
      countries.find { |country| country['code'] == code }
    end

    # Option list for HTML select
    def option_list(label_attribute = 'name')
      countries.map { |country| [country[label_attribute], country['code']] }
    end

    # List of countries
    def countries
      @countries ||= JSON.parse(
        File.read(File.expand_path(
                    "shopify_countries/#{COUNTRY_DATA_FILE_NAME}.json", __dir__
                  ))
      )
    end
    alias all countries
  end
end
