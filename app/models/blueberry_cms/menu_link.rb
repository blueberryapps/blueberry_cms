module BlueberryCMS
  class MenuLink
    include Mongoid::Document

    field :anchor,     localize: true
    field :css_class
    field :name,       localize: true
    field :page_id,    type: BSON::ObjectId
    field :position,   type: Integer
    field :new_window, type: Boolean
    field :url,        type: String, localize: true

    embedded_in :menu, class_name: 'BlueberryCMS::Menu'

    before_save :assign_default_position, if: :assign_default_position?

    def page
      Page.find(page_id) if page_id
    end

    private

    def assign_default_position
      links = menu.links
      self.position = if links.where(:position.ne => nil).any?
                        links.where(:position.ne => nil).last.position + 1
                      else
                        0
                      end
    end

    def assign_default_position?
      position.nil?
    end
  end
end
