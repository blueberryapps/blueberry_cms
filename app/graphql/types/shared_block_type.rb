module Types
  class SharedBlockType < Types::BaseObject
    implements PageBlockInterface

    field :block, PageBlockInterface, null: true
  end
end
