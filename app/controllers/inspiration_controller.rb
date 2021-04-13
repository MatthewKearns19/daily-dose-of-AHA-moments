class InspirationController < ApplicationController
  #bootstrapped panigation nav bar to load 20 API calls per page( max =20). Previous
  #page is disabled when the current start=0, and then the current per page
  # value is added or subtracted from the current value( i.e the new current
  # value will be > 0 once clicked once and this 'top' path is called again)
  def news_topics
    @start = (params[:start] || 0).to_i # convert to an integer
    @per_page = (params[:per_page] || 10).to_i # convert to an integer
    @count = 0
    @stories = hacker_news_client.topstories(@start, @per_page)
    #@this_is_default_view = 'present'
  end

  # retrieves the comments of news_topics
  def news_topics_comments
    @story = hacker_news_client.item(params[:id])
    @comments = (@story['kids'] || []).map do |comment|
      hacker_news_client.item(comment)
    end
  end

  # calls the second api:newscatcher for customized topic requests
  def custom_latest_articles
    @start = (params[:start] || 0).to_i # convert to an integer
    @per_page = (params[:per_page] || 10).to_i # convert to an integer

    @count = 0
    @custom_topic = params[:custom_topic]
    @articles = custom_newscatcher_client.latest_articles(@start, @per_page, @custom_topic)
  end

  # calls the third api:newsapi for customized topic requests
  def custom_latest_headlines
    @start = (params[:start] || 0).to_i # convert to an integer
    @per_page = (params[:per_page] || 10).to_i # convert to an integer

    @custom_topic = params[:custom_topic]

    @count = 0 # temporarily disdable @is_remaining to save our requests while developing
    # full breakdown of 'is_remaining' in lib -> my_news_api -> client
    #@is_remaining = custom_newsapi_client.headlines_count(@start, @per_page, @custom_topic)

    @headlines = custom_newsapi_client.top_headlines(@start, @per_page, @custom_topic)
  end

end
