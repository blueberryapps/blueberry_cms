module Types
    class MenuType < Types::BaseObject
      field :id, ID, null: false
      field :links, [MenuLinkType], null: false
      field :name, String, null: false
      field :slugs, [String], null: false

      def links
        object.links.active
      end
    end
  end
