module Types
  class CardType < Types::BaseObject
    field :title, String, null: true
    field :topContent, String, null: true
    field :bottomContent, String, null: true
    field :image, Types::ImageType, null: true
  end
end
