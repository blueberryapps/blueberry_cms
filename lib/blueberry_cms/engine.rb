require 'carrierwave'
require 'carrierwave/mongoid'
require 'cocoon'
require 'liquid'
require 'mongoid'
require 'mongoid/slug'
require 'mongoid/tree'
require 'redcarpet'
require 'simple_form'
require 'slim-rails'
require 'wisper'

module BlueberryCMS
  class Engine < ::Rails::Engine
    isolate_namespace BlueberryCMS
    config.to_prepare do
      ApplicationController.helper(MenusHelper)
    end
  end
end
