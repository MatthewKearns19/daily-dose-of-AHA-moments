# source 1 - https://blog.appsignal.com/2019/04/30/ruby-magic-hidden-gems-delegator-forwardable.html
# source 2 - https://refactoring.guru/design-patterns/decorator/ruby/example

module Regionaldecorator

  class Unitedstatesdecorator < Regionaldelegator
    def construct_url(url)
      @url.construct_url("#{url}&country=us")
    end
  end
end
