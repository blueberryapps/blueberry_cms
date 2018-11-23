module BlueberryCMS
  class Configuration
    attr_accessor :enabled_versions, :page_admin_controller, :custom_blocks

    def initialize
      self.enabled_versions      = false
      self.page_admin_controller = 'ApplicationController'
      self.custom_blocks         = []
    end
  end
end
