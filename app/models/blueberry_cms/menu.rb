module BlueberryCMS
  class Menu
    include Mongoid::Document

    field :name,            type: String

    embeds_many :links,  class_name:        'BlueberryCMS::MenuLink',
                         cascade_callbacks: true,
                         order:             :position.asc

    accepts_nested_attributes_for :links, allow_destroy: true

  end
end
