module BlueberryCMS
  class Image
    include Mongoid::Document
    include Mongoid::Paperclip

    embedded_in :attachable, polymorphic: true

    has_mongoid_attached_file :image, styles: { small: ['250x250', :jpg] }

    validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }
  end
end
