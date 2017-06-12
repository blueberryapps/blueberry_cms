module BlueberryCMS
  class Page
    include Mongoid::Document
    include Mongoid::Tree
    include Mongoid::Tree::Traversal
    include Mongoid::Tree::Ordering
    include Mongoid::Slug
    include BlueberryCMS::Sortable

    field :name,             localize: true
    field :meta_title,       localize: true
    field :meta_description, localize: true
    field :meta_keywords,    localize: true, type: Array
    field :slug,             localize: true
    field :path,             localize: true
    field :published_at,     type: DateTime
    field :show_in_menu,     type: Boolean
    field :show_in_footer,   type: Boolean

    embeds_many :blocks, class_name:        'BlueberryCMS::PageBlock',
                         cascade_callbacks: true,
                         order:             :position.asc

    slug :name, localize: true

    accepts_nested_attributes_for :blocks, allow_destroy: true

    validates :path, uniqueness: true
    validates :name, presence: true

    before_destroy :ensure_root, :move_children_to_parent
    after_rearrange :rebuild_path

    scope :in_menu,   -> { where(show_in_menu: true) }
    scope :in_footer, -> { where(show_in_footer: true) }

    def to_path
      "/#{I18n.locale}#{path}"
    end

    private

    def ensure_root
      if root?
        errors.add(:base, :invalid)
        throw :abort
      end
    end

    def rebuild_path
      self.path_translations = I18n.available_locales.each_with_object({}) do |locale, translations|
        I18n.with_locale(locale) do
          translations[locale] = generate_path
        end
      end
    end

    def generate_path
      return '/' if root?

      [parent.path, slug_builder.to_url].join('/').gsub('//', '/')
    end
  end
end
