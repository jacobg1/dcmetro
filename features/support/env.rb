require 'coveralls'
Coveralls.wear!

require 'aruba/cucumber'
require 'json'
require 'rest-client'
require 'dcmetro'

DCMETRO_KEY=ENV['DCMETRO_KEY']
BASE_URL="http://api.wmata.com"

Before ("@check ") do
    def valid_json?(json)
        begin
            JSON.parse(json)
            true
        rescue
            false
        end
    end
end