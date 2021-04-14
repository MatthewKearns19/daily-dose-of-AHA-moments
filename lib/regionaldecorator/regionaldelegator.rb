# source 1 - https://blog.appsignal.com/2019/04/30/ruby-magic-hidden-gems-delegator-forwardable.html
# source 2 - https://refactoring.guru/design-patterns/decorator/ruby/example

module Regionaldecorator

  # the decorator base class to delegates to the wrapped component
  class Regionaldelegator < Urlconstructor
    attr_accessor :url
    
    def initialize(url)
      @url = url
    end

    # delegating to the wrapper, esentially calling super()
    def construct_url(url)
      @url.construct_url(url)
    end
  end
end
