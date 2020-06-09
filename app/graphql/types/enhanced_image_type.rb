module Types
  class EnhancedImageType < Types::BaseObject
    field :href, String, null: true
    field :name, String, null: true
    field :image, Types::ImageType, null: true
  end
end
