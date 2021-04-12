require 'news-api'
module Newsapi

  class Client
    def initialize
      @newsapi = News.new("7ea1d39d716c490fa3f636cbb694beae")
      #newsapi = News.new("4eb578035e5a47f4ab409ecf9d122868")
      #@url = 'https://newsapi.org/v2/top-headlines?category=business&apiKey=7ea1d39d716c490fa3f636cbb694beae'
    end

    # gets +1 to let us know if there is any data left, and if not we must disable the pagnation button. Since our view
    # is set to display 10 headings (articles) per page in our pagnation, I origionally set a count on the headings loop
    # in the views to disable this 'next page' pagnation button if the articles displayed were less than 10. However, if
    # there were exactly 10 displaying yet no remaining articles to retrieve from our api then this count would not disable
    # the 'next page' button. This approach below returns int=11 (10+1) for each itteration of our pagnation, which is
    # valid as we set 10 per page and added 1, so anything less than 11 the 'next page' button will be disabled
    def headlines_count(start = @start, per_page = @per_page, topic = @custom_topic)
      page = per_page + 1
      headlines = @newsapi.get_top_headlines(category: "#{topic}", language: "en", country: "us")[start...start + page]

      is_remaining = headings.size

      is_remaining
    end

    # takes in the requested topic by the user
    def top_headlines(start = @start, per_page = @per_page, topic = @custom_topic)
      headlines = @newsapi.get_top_headlines(category: "#{topic}", language: "en", country: "us")[start...start + per_page]

      puts headlines

      headlines
    end
  end
end
