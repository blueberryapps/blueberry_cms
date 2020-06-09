class ImageUploader < BaseUploader
  version :content, if: :not_svg_file? do
    process resize_to_limit: [1130, 1130]
  end

  version :thumb, if: :not_svg_file? do
    process resize_to_fill: [240, 150]
  end

  version :article_thumb, if: :not_svg_file? do
    process resize_to_fill: [732, 302]
  end

  version :gallery_thumb, if: :not_svg_file? do
    process resize_to_fill: [500, 400]
  end

  version :article_full, if: :not_svg_file? do
    process resize_to_fill: [1530, 302]
  end

  version :logo, if: :not_svg_file? do
    process resize_to_limit: [160, 115]
  end

  version :gallery__image, if: :not_svg_file? do
    process resize_to_limit: [320, 320]
  end

  version :gallery_block, if: :not_svg_file? do
    process resize_to_fit: [400, 400]
  end

  def extension_white_list
    %w(jpg jpeg gif png svg)
  end

  private

  def not_svg_file?(image)
    image&.content_type != 'image/svg+xml'
  end
end
