module Types
  class TabsBlockType < Types::BaseObject
    implements PageBlockInterface

    field :tabs, [Types::TabType], null: false
  end
end
