module Types
  class LinkType < Types::BaseObject
    field :cssClass, String, null: true
    field :title, String, null: true
    field :description, String, null: true
    field :url, String, null: true
    field :page, Types::PageType, null: true
    field :image, Types::ImageType, null: true
  end
end
