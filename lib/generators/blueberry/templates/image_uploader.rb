class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process quality: 70

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [1024, 768]

  version :thumb_xs do
    process resize_to_fill: [110, 110]
  end

  version :thumb do
    process resize_to_fill: [240, 150]
  end

  version :medium do
    process resize_to_fill: [320, 150]
  end

  version :large do
    process resize_to_fill: [600, 600]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
