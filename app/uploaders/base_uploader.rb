class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::Backgrounder::Delay if CarrierWave::Backgrounder.backend
  include CarrierWave::MiniMagick
end
