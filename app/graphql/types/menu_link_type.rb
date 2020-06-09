module Types
  class MenuLinkType < Types::BaseObject
    field :id, ID, null: false
    field :anchor, String, null: true
    field :cssClass, String, null: true
    field :name, String, null: true
    field :newWindow, Boolean, null: true
    field :page, PageType, null: true
    field :position, Integer, null: true
    field :url, String, null: true

    def name
      object.name.presence || object.page&.name
    end
  
    def url
      [
        (object.page&.to_path || object.url),
        object.anchor.presence
      ].compact.join('#')
    end
  end
end
