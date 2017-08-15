require 'blueberry_cms/engine'
require 'blueberry_cms/liquid_tags/page_link'

module BlueberryCMS
  mattr_accessor :page_admin_controller, :custom_blocks

  @@parent_controller = 'ApplicationController'
  @@custom_blocks     = []

  def self.config
    yield self
  end

  def self.scope=(scope)
    RequestStore.store[:blueberry_cms] = scope
  end

  def self.scope
    RequestStore.store[:blueberry_cms] || nil
  end
end

