module Types
  class PartnerType < Types::BaseObject
    field :id, ID, null: false
    field :image, Types::ImageType, null: true
    field :url, String, null: false
    field :name, String, null: false
  end
end
