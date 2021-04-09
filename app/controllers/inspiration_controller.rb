class InspirationController < ApplicationController
  #bootstrapped vanigation bar to load 20 API calls per page( max =20). Previous
  #page is disabled when the current start=0, and then the current per page
  # value is added or subtracted from the current value( i.e the new current
  # value will be > 0 once clicked once and this 'top' path is called again)
  def news_topics
    @start = (params[:start] || 0).to_i
    @per_page = (params[:per_page] || 10).to_i
    @per_page = [@per_page, 20].min # max 20 per page

    @stories = hacker_news_client.topstories(@start, @per_page)
  end

  # retrieves the comments of news_topics
  def news_topics_comments
    @story = hacker_news_client.item(params[:id])
    @comments = (@story['kids'] || []).map do |comment|
      hacker_news_client.item(comment)
    end
  end

  # calls the second api:newsscratcher for customized topic requests
  def custom_latest_headlines
    @start = (params[:start] || 0).to_i
    @per_page = (params[:per_page] || 10).to_i
    @per_page = [@per_page, 20].min # max 20 per page

    @count = 0
    @topic = 'sport'
    @headlines = custom_latest_news_client.latest_headlines(@start, @per_page)
  end

  # calls the third api:newsapi for customized topic requests
  def my_news_api
    @start = (params[:start] || 0).to_i
    @per_page = (params[:per_page] || 10).to_i
    @per_page = [@per_page, 20].min # max 20 per page

    # testing the category within the request, to be cleaned up later to allow
    # category requests by the user within teh app
    @custom_topic = 'business'
    @headings = news_api.top_headings(@start, @per_page, @custom_topic)
  end

end
