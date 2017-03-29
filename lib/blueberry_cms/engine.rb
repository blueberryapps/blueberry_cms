require 'carrierwave'
require 'carrierwave/mongoid'
require 'cocoon'
require 'liquid'
require 'mongoid'
require 'mongoid/slug'
require 'mongoid/tree'
require 'rails-assets-voidberg--html5sortable'
require 'redcarpet'
require 'simple_form'
require 'slim-rails'
require 'wisper'

module BlueberryCMS
  class Engine < ::Rails::Engine
    isolate_namespace BlueberryCMS
  end
end
