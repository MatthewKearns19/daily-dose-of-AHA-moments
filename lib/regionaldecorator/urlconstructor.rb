# source 1 - https://blog.appsignal.com/2019/04/30/ruby-magic-hidden-gems-delegator-forwardable.html
# source 2 - https://refactoring.guru/design-patterns/decorator/ruby/example

#require 'delegate'

module Regionaldecorator

  # default implementation for the decorations, just returning the url.
  # 'construct_url' is consistent throughout operations
  class Urlconstructor
    def construct_url(url)
      return url
    end
  end
end
