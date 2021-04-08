class InspirationController < ApplicationController
  #bootstrapped vanigation bar to load 20 API calls per page( max =20). Previous
  #page is disabled when the current start=0, and then the current per page
  # value is added or subtracted from the current value( i.e the new current
  # value will be > 0 once clicked once and this 'top' path is called again)
  def top
    @start = (params[:start] || 0).to_i
    @per_page = (params[:per_page] || 10).to_i
    @per_page = [@per_page, 20].min # max 20 per page

    @stories = client.topstories(@start, @per_page)
  end

  def topics_comments
    @story = client.item(params[:id])
    @comments = (@story['kids'] || []).map do |comment|
      client.item(comment)
    end
  end

end
