module Types
  class VideoGalleryBlockType < Types::BaseObject
    implements PageBlockInterface

    field :content, String, null: true
    field :videos, [Types::VideoType], null: false
  end
end
