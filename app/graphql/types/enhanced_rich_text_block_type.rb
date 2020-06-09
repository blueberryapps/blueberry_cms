module Types
  class EnhancedRichTextBlockType < Types::BaseObject
    implements PageBlockInterface

    field :image, Types::ImageType, null: true
    field :left_content, String, null: true
    field :right_content, String, null: true
    field :title, String, null: true
  end
end
