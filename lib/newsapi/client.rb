require 'news-api'
module Newsapi

  class Client
    def initialize
      @newsapi = News.new("7ea1d39d716c490fa3f636cbb694beae")
      #newsapi = News.new("4eb578035e5a47f4ab409ecf9d122868")
      #@url = 'https://newsapi.org/v2/top-headlines?category=business&apiKey=7ea1d39d716c490fa3f636cbb694beae'
    end

    def item(id)
      get("item/#{id}")
    end

    def top_headings(start = @start, per_page = @per_page, topic = @custom_topic)
      headings = @newsapi.get_top_headlines(category: "#{topic}", language: "en", country: "us")[start...start + per_page]


      headings
    end

    private

    def get(topic)
      @newsapi.get_top_headlines(category: 'business', language: 'en', country: 'us')
    end
  end
end
