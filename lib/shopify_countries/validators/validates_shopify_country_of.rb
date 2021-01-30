# frozen_string_literal: true

module ActiveModel
  module Validations
    class ShopifyCountryValidator < EachValidator
      COUNTRY_ATTRIBUTE = 'code'

      def validate_each(record, attribute, value)
        country_attribute = options[:find_by].presence || COUNTRY_ATTRIBUTE

        raise 'Invalid country attribute' unless %w[name code].include? country_attribute

        country = if country_attribute == 'name'
                    ShopifyCountries.find_by_name(value)
                  else
                    ShopifyCountries.find_by_code(value)
                  end

        record.errors.add(attribute, 'country must be in list') if country.nil?
      end
    end

    module ClassMethods
      # Validates whether or not the specified country is Shopify's.
      #
      #   class Address < ActiveRecord::Base
      #     validates_shopify_country_of :country
      #   end
      #
      def validates_shopify_country_of(*attr_names)
        validates_with ShopifyCountryValidator, _merge_attributes(attr_names)
      end
    end
  end
end
