module Types
  class GalleryBlockType < Types::BaseObject
    implements PageBlockInterface

    field :content, String, null: true
    field :orientation, String, null: true
    field :images, [Types::EnhancedImageType], null: false
  end
end
