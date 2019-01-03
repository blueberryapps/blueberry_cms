module BlueberryCMS
  module PageBlocks
    class Gallery < PageBlock
      embeds_many :images, as: :attachable, class_name: 'BlueberryCMS::Image', cascade_callbacks: true

      field :content, localize: true
      field :orientation,    type: String
      field :red_background, type: Boolean

      ORIENTATION = %w[left right].freeze

      accepts_nested_attributes_for :images, allow_destroy: true

      attr_reader :images_files

      def images_files=(files)
        Array(files).each do |file|
          images.build(image: file)
        end
      end
    end
  end
end
