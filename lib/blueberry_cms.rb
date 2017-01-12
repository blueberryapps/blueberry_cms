require "blueberry_cms/engine"
require "blueberry_cms/liquid_tags/page_link"

module BlueberryCMS
  mattr_accessor :page_admin_controller

  @@parent_controller = 'ApplicationController'
end
