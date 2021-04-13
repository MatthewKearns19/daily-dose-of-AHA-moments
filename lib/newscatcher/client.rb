# source = 'https://rapidapi.com/newscatcher-api-newscatcher-api-default/api/newscatcher'
require 'uri'
require 'net/http'
require 'openssl'
# custom gem to de-couple the request setup and response from the this client class
require 'basenewscatcherbuilder'

module Newscatcher
  class Client
    def initialize
      @host = "newscatcher.p.rapidapi.com"
      @key = "732b68534emsh8689143e0b4b2e5p130765jsnd59cb1a075b7"
    end

    def latest_articles(start = @start, per_page = @start, topic = @custom_topic)
      articles = get(topic)[start...start + per_page]


      articles
    end

    private

    def get(topic)
      #url = URI("https://newscatcher.p.rapidapi.com/v1/latest_headlines?topic=tech&lang=en&media=True.json?print=pretty")
      @url = "https://newscatcher.p.rapidapi.com/v1/latest_headlines?topic=" + "#{topic}" + "&lang=en&media=True.json?print=pretty"
      
      headings = NewscatcherBase.runrequest(@host, @key, @url)


      articles = headings['articles']

      articles
    end

  end
end
