module BlueberryCMS
  module PageBlocks
    class Links < PageBlock
      field :content, localize: true
      field :title,   localize: true

      embeds_many :links, class_name: 'BlueberryCMS::Link', cascade_callbacks: true

      accepts_nested_attributes_for :links, allow_destroy: true
    end
  end
end
