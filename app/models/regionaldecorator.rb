# source 1 - https://blog.appsignal.com/2019/04/30/ruby-magic-hidden-gems-delegator-forwardable.html
# source 2 - https://refactoring.guru/design-patterns/decorator/ruby/example

#require 'delegate'

module Regionaldecorator

  # default implementation for the decorations, just returning the url.
  # 'construct_url' is consistent throughout operations
  class UrlConstructor
    def construct_url(url)
      return url
    end
  end

  # the decorator base class to delegates to the wrapped component
  class RegionalDelegator < UrlConstructor
    attr_accessor :url

    def initialize(url)
      @url = url
    end

    # delegating to the wrapper, esentially calling super()
    def construct_url(url)
      @url.construct_url(url)
    end
  end


  ################# Language Decorators ############

  class EnglishDecorator < RegionalDelegator
    def construct_url(url)
      @url.construct_url("#{url}&lang=en")
    end
  end

  class GermanDecorator < RegionalDelegator
    def construct_url(url)
      @url.construct_url("#{url}&lang=de")
    end
  end


  ################# Country Decorators #############

  class UnitedStatesDecorator < RegionalDelegator
    def construct_url(url)
      @url.construct_url("#{url}&country=us")
    end
  end

  class GermanyDecorator < RegionalDelegator
    def construct_url(url)
      @url.construct_url("#{url}&country=de")
    end
  end


  ################ Media Decorators ################
  class MediaTrueDecorator < RegionalDelegator
    def construct_url(url)
      @url.construct_url("#{url}&media=True")
    end
  end

  class MediaFalseDecorator < RegionalDelegator
    def construct_url(url)
      @url.construct_url("#{url}&media=False")
    end
  end
end
