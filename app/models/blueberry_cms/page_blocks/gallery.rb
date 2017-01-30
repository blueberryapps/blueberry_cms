module BlueberryCMS
  module PageBlocks
    class Gallery < PageBlock
      embeds_many :images, as: :attachable, class_name: 'BlueberryCMS::Image', cascade_callbacks: true

      accepts_nested_attributes_for :images, allow_destroy: true

      def new_image
      end

      def new_image=(uploaded_images)
        Array(uploaded_images).each do |uploaded_image|
          images.build(image: uploaded_image)
        end
      end
    end
  end
end
