# source = 'https://rapidapi.com/newscatcher-api-newscatcher-api-default/api/newscatcher'
require 'uri'
require 'net/http'
require 'openssl'

module Newscatcher
  class Client
    def initialize
      @host = "newscatcher.p.rapidapi.com"
      @key = "732b68534emsh8689143e0b4b2e5p130765jsnd59cb1a075b7"
    end

    def latest_headlines(start = @start, per_page = @start, expand = true )
      articles = get('latest_headlines')[start...start + per_page]


      articles
    end

    private

    def get(path)
      #url = URI("https://newscatcher.p.rapidapi.com/v1/latest_headlines?topic=tech&lang=en&media=True.json?print=pretty")
      url = URI("https://newscatcher.p.rapidapi.com/v1/latest_headlines?topic=tech&lang=en&media=True.json?print=pretty")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = @key
      request["x-rapidapi-host"] = @host

      response = http.request(request)

      headings = JSON.parse(response.read_body)

      puts headings['articles']

      articles = headings['articles']

      articles
    end

  end
end
