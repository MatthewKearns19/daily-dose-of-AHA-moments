require 'uri'
require 'net/http'
require 'openssl'

module Newscatcher
  class Client
    def initialize
    #@host = 'https://newscatcher.p.rapidapi.com/v1/latest_headlines?'
    #@host = 'https://newscatcher.firebaseio.com/v1/latest_headlines?'
    @host = "newscatcher.p.rapidapi.com"
    @key = "732b68534emsh8689143e0b4b2e5p130765jsnd59cb1a075b7"
    end

    def item(id)
      get("item/#{id}")
    end

    def latest_headlines(start = @start, per_page = @start, expand = true )

      url = URI("https://newscatcher.p.rapidapi.com/v1/latest_headlines?lang=en&media=True")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = '732b68534emsh8689143e0b4b2e5p130765jsnd59cb1a075b7'
      request["x-rapidapi-host"] = 'newscatcher.p.rapidapi.com'

      response = http.request(request)
      puts response.read_body

      headlines = JSON.parse(response.read_body)

      if expand
        headlines.map! do |headline|
          item(headline)
        end
      end

      headlines
    end

  end
end
