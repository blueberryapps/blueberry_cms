module BlueberryCMS
  class Menu
    include Mongoid::Document
    include Mongoid::Slug

    field :name, type: String
    validates :name, presence: true

    slug :name

    embeds_many :links,  class_name:        'BlueberryCMS::MenuLink',
                         cascade_callbacks: true,
                         order:             :position.asc

    accepts_nested_attributes_for :links, allow_destroy: true

    scope :ordered, -> { order(name: :asc) }
  end
end
