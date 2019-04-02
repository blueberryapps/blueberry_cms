module BlueberryCMS
  module PageBlocks
    class RichText < PageBlock
      include MongoidEnumerable

      field :content, localize: true

      enumerable :orientation, %i[left right]

      mount_uploader :image, ImageUploader
      mount_uploader :background_image, ImageUploader
    end
  end
end
