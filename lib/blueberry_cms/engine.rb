require 'cocoon'
require 'liquid'
require 'mongoid'
require 'mongoid/tree'
require 'redcarpet'
require 'simple_form'
require 'slim-rails'

module BlueberryCMS
  class Engine < ::Rails::Engine
    isolate_namespace BlueberryCMS
  end
end
