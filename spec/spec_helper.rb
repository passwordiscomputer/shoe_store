ENV['RACK_ENV'] = 'test'

require("rspec")
require("sinatra/activerecord")
require("brand")
require("store")
require "pry"

RSpec.configure do |config|
  config.after(:each) do
    Brand.all().each() do |brand|
      brand.destroy()
    end

    Store.all().each() do |store|
      store.destroy()
    end

  end
end
