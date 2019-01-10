module BlueberryCMS
  class Link
    include Mongoid::Document

    field :css_class,        type: String
    field :title,            type: String
    field :description,      type: String
    field :url,              type: String
    field :page_id,          type: BSON::ObjectId
    field :image_tmp,        type: String

    embedded_in :links, class_name: 'BlueberryCMS::PageBlocks::Links'

    mount_uploader :image, ImageUploader

    def self.find(id)
      _id = BSON::ObjectId.from_string(id)
      page  = BlueberryCMS::Page.find_by('blocks.links._id' => _id)
      links = page.blocks.find_by('links._id' => _id)
      links.links.find_by('_id' => _id)
    end

    def page
      Page.find(page_id) if page_id
    end
  end
end
