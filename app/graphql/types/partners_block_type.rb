module Types
  class PartnersBlockType < Types::BaseObject
    implements PageBlockInterface

    field :content, String, null: true
    field :title, String, null: true
    field :partners, [Types::PartnerType], null: false
  end
end
