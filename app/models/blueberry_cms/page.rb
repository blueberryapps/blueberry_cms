module BlueberryCMS
  class Page
    include Mongoid::Document
    include Mongoid::Tree
    include Mongoid::Tree::Ordering

    field :name
    field :meta_title,       localize: true
    field :meta_description, localize: true
    field :meta_keywordds,   localize: true, type: Array
    field :slug,             localize: true
    field :path,             localize: true
    field :published_at,     type: DateTime
    field :show_in_menu,     type: Boolean

    embeds_many :blocks, class_name: 'BlueberryCMS::PageBlock'
    accepts_nested_attributes_for :blocks, allow_destroy: true

    validates :path, uniqueness: true

    after_rearrange :rebuild_path

    before_destroy :move_children_to_parent

    scope :in_menu, -> { where(show_in_menu: true) }

    def path
      root? ? '' : super
    end

    def to_path
      "/#{I18n.locale}#{path}"
    end

    private

    def rebuild_path
      self.path_translations = I18n.available_locales.each_with_object({}) do |locale, translations|
        I18n.with_locale(locale) do
          pages = self.ancestors_and_self.collect(&:slug).select(&:present?)
          translations[locale] = '/' + pages.join('/')
        end
      end
    end
  end
end
