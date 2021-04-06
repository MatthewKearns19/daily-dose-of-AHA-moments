class InspirationController < ApplicationController
  def top
    @stories = client.topstories(0, 10)
  end

end
