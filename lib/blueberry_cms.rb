require 'blueberry_cms/engine'
require 'blueberry_cms/liquid_tags/page_link'

module BlueberryCMS
  mattr_accessor :page_admin_controller
  mattr_accessor :custom_blocks

  @@parent_controller = 'ApplicationController'

  @@custom_blocks = []
end
