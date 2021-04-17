# source of api used in this class = 'https://rapidapi.com/newscatcher-api-newscatcher-api-default/api/newscatcher'

# custom gem to de-couple the request setup and response from the this client class
require 'basenewscatcherbuilder'

module Newscatcher
  class Client
    def initialize
      @host = "newscatcher.p.rapidapi.com"
      @key = "732b68534emsh8689143e0b4b2e5p130765jsnd59cb1a075b7"
    end

    def latest_articles(start = @start, per_page = @start, query = @query)
      puts query
      articles = get(query)[start...start + per_page]



      articles
    end

    private

    def get(query)
      @url = "https://newscatcher.p.rapidapi.com/v1/latest_headlines?topic=" + "#{query}"

      # send to custom gem
      headings = NewscatcherBase.runrequest(@host, @key, @url)
      puts headings


      articles = headings['articles']

      articles
    end

  end
end
