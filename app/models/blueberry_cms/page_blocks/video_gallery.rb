module BlueberryCMS
  module PageBlocks
    class VideoGallery < PageBlock
      embeds_many :videos, class_name:        'BlueberryCMS::Video',
                           cascade_callbacks: true,
                           order:             :position.asc

      field :content, localize: true

      accepts_nested_attributes_for :videos, allow_destroy: true
    end
  end
end
