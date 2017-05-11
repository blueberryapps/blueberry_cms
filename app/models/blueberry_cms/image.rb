module BlueberryCMS
  class Image
    include Mongoid::Document

    field :name, localize: true

    mount_uploader :image, ImageUploader

    embedded_in :attachable, polymorphic: true
  end
end
