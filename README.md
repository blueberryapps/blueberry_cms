# BlueberryCMS
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'blueberry_cms'
```

Add this line to your application's sass:

```sass
@import blueberry_cms
```

Add this line to your application's coffeescript:

```coffee
#= require blueberry_cms
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install blueberry_cms
```
## BlueberryCMS::Page custom fields
```ruby
# config/initializers/blueberry_cms.rb

module BreadcrumbLeft
  extend ActiveSupport::Concern

  included do
    field :breadcrumb_left, type: Boolean, default: false
  end
end

ActiveSupport::Reloader.to_prepare do
  BlueberryCMS::Page.send(:include,  BreadcrumbLeft)
end
```

```slim
# app/views/blueberry_cms/admin/pages/_custom_fields.html.slim

= f.input :breadcrumb_left
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
