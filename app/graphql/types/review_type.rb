module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :image, Types::ImageType, null: true
    field :name, String, null: false
    field :position, String, null: true
    field :quote, String, null: true
  end
end
