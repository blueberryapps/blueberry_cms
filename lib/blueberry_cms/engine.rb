require 'carrierwave'
require 'carrierwave/mongoid'
require 'cocoon'
require 'draper'
require 'liquid'
require 'mongoid'
require 'mongoid/slug'
require 'mongoid/tree'
require 'mongoid_enumerable'
require 'rails-assets-voidberg--html5sortable'
require 'redcarpet'
require 'simple_form'
require 'slim-rails'
require 'vimeo'
require 'wisper'

module BlueberryCMS
  class Engine < ::Rails::Engine
    isolate_namespace BlueberryCMS

    config.to_prepare do
      ApplicationController.helper(MenusHelper)
    end
  end
end
