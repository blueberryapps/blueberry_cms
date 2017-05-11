module BlueberryCMS
  class Image
    include Mongoid::Document

    field :name, localize: true

    mount_uploader :image, ImageUploader
    process_in_background :image if ::CarrierWave::Backgrounder.backend

    embedded_in :attachable, polymorphic: true
  end
end
