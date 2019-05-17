require 'blueberry_cms/engine'
require 'blueberry_cms/liquid_tags/page_link'
require 'blueberry_cms/liquid_tags/page_url'

module BlueberryCMS
  mattr_accessor :page_admin_controller, :custom_blocks, :force_locale

  @@parent_controller = 'ApplicationController'
  @@custom_blocks     = []
  @@force_locale      = true

  def self.config
    yield self
  end
end
