module BlueberryCMS
  class Image
    include Mongoid::Document

    field :name, localize: true
    field :image_processing, type: Boolean, default: false

    mount_uploader :image, ImageUploader

    def self.find(id)
      _id = BSON::ObjectId.from_string(id)
      page = BlueberryCMS::Page.find_by('blocks.images._id' => _id)
      gallery = page.blocks.find_by('images._id' => _id)
      gallery.images.find_by('_id' => _id)
    end

    embedded_in :attachable, polymorphic: true
  end
end
