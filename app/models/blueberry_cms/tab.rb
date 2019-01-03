module BlueberryCMS
  class Tab
    include Mongoid::Document

    field :content,  type: String
    field :position, type: Integer
    field :title,    type: String

    embedded_in :tabs, class_name: 'BlueberryCMS::PageBlocks::Tabs'

    validates :title, :content, presence: true
  end
end
