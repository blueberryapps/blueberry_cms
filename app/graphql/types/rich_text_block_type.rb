module Types
  class RichTextBlockType < Types::BaseObject
    implements PageBlockInterface

    field :content, String, null: true
    field :orientation, String, null: true
    field :image, Types::ImageType, null: true
    field :backgroundImage, Types::ImageType, null: true
  end
end
