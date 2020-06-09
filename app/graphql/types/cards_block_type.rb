module Types
  class CardsBlockType < Types::BaseObject
    implements PageBlockInterface

    field :cards, [Types::CardType], null: false
  end
end
