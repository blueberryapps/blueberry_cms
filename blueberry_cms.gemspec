$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'blueberry_cms/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'blueberry_cms'
  s.version     = BlueberryCMS::VERSION
  s.authors     = ['Martin Magnusek', 'Antonín Pleskač']
  s.email       = ['magnusekm@gmail.com']
  s.homepage    = 'http://github.com/blueberry/blueberry_cms'
  s.summary     = 'Summary of BlueberryCMS.'
  s.description = 'Description of BlueberryCMS.'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'carrierwave'
  s.add_dependency 'carrierwave-mongoid'
  s.add_dependency 'cocoon'
  s.add_dependency 'liquid'
  s.add_dependency 'mongoid'
  s.add_dependency 'mongoid-slug'
  s.add_dependency 'mongoid-tree'
  s.add_dependency 'rails', '~> 5.0'
  s.add_dependency 'rails-assets-voidberg--html5sortable', '0.4.4'
  s.add_dependency 'redcarpet'
  s.add_dependency 'simple_form'
  s.add_dependency 'slim-rails'
  s.add_dependency 'wisper', '~> 2.0.0'

  s.add_development_dependency 'sqlite3'
end
