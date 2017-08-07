module BlueberryCMS
  class MenuLink
    include Mongoid::Document
    include BlueberryCMS::SimpleSortable

    field :position,         type: Integer
    field :css_class
    field :anchor
    field :name
    field :url,              type: String
    field :page_id,          type: BSON::ObjectId

    embedded_in :menu, class_name: 'BlueberryCMS::Menu'

    def page
      Page.find(page_id) if page_id
    end
  end
end
