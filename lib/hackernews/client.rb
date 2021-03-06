# source: 'https://rapidapi.com/community/api/hacker-news'
require 'singleton'
module Hackernews
  class Client
    include Singleton

    def initialize
      @host = 'hacker-news.firebaseio.com/v0'
    #  @host = 'community-hacker-new-v1.p.rapidapi.com'
    #  @key = '732b68534emsh8689143e0b4b2e5p130765jsnd59cb1a075b7'
    end

    #our api returns id's so we need to take this id from our origional response,
    # re-run our request with the id extracted within the 'item' path,
    # and parse that new json response to be our stories
    def item(id)
      get("item/#{id}")
    end

    def topstories(start = 0, per_page = 10, expand = true)
      stories = get('topstories')[start...start + per_page]

      if expand
        stories.map! do |story|
          item(story)
        end
      end

      stories
    end

    private

    def get(path)
      response = Excon.get('https://' + @host + '/' + path + '.json?print=pretty')
        #headers: {
        #  'x-rapidapi-host' => @host,
        #  'x-rapidapi-key' => @key,
        #}
      #)

      return false if response.status != 200

      JSON.parse(response.body)
    end
  end
end
