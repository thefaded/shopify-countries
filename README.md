# ShopifyCountries

Gem provides list of Shopify's countries and ActiveModel validator `validates_shopify_country_of`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shopify_countries'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install shopify_countries

## Usage

Currently it provides only few public methods:

```ruby
    ShopifyCountries.find_by_name("United States")
    ShopifyCountries.find_by_code("GB")
    ShopifyCountries.option_list # to get options for HTML select
    ShopifyCountries.countries # or alias `all`
```

### Validator

Just add `validates_shopify_country_of :country_code` to your ActiveModel class, by default it will search country
by country code, if you want to specify another attribe, use `find_by` option - `validates_shopify_country_of :country, { find_by: 'name' }`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thefaded/shopify_countries.
