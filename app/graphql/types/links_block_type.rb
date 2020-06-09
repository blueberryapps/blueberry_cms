module Types
  class LinksBlockType < Types::BaseObject
    implements PageBlockInterface

    field :content, String, null: true
    field :title, String, null: true
    field :links, [Types::LinkType], null: false
  end
end
