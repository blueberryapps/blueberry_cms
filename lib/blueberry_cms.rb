require 'blueberry_cms/engine'
require 'blueberry_cms/configuration'
require 'blueberry_cms/liquid_tags/page_link'
require 'blueberry_cms/liquid_tags/page_url'

module BlueberryCMS
  class << self
    def config(&block)
      @configuration ||= Configuration.new
      yield @configuration if block_given?
      @configuration
    end
  end
end
