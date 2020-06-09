module Types
  class TabType < Types::BaseObject
    field :content, String, null: true
    field :position, Integer, null: true
    field :title, String, null: true
  end
end
