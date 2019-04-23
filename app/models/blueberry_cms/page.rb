require 'redcarpet/render_strip'

module BlueberryCMS
  class Page
    include Mongoid::Document
    include Mongoid::Tree
    include Mongoid::Tree::Traversal
    include Mongoid::Tree::Ordering
    include Mongoid::Slug
    include BlueberryCMS::Sortable

    field :active,           localize: true, type: Boolean
    field :custom_slug,      localize: true
    field :meta_description, localize: true
    field :meta_keywords,    localize: true, type: Array
    field :meta_title,       localize: true
    field :name,             localize: true
    field :path,             localize: true
    field :published_at,     type: DateTime
    field :show_in_footer,   type: Boolean
    field :show_in_menu,     type: Boolean
    field :slug,             localize: true

    embeds_many :blocks, class_name:        'BlueberryCMS::PageBlock',
                         cascade_callbacks: true,
                         order:             :position.asc

    slug :slug_source, localize: true

    accepts_nested_attributes_for :blocks, allow_destroy: true

    validates :path, uniqueness: true
    validates :name, presence: true

    after_save :rebuild_children_paths

    before_destroy :ensure_root, :move_children_to_parent
    after_rearrange :rebuild_path

    scope :active,    -> { where(active: true) }
    scope :in_menu,   -> { where(show_in_menu: true) }
    scope :in_footer, -> { where(show_in_footer: true) }
    scope :ordered, lambda {
      order(name: :asc).collation(locale: 'cs', strength: 1)
    }

    def slug_source
      renderer = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
      renderer.render(custom_slug.presence || name.presence || '').squish
    end

    def rebuild_children_paths
      if %i[custom_slug name].any? { |f| attribute_changed? f.to_s }
        children.each(&:save)
      end
    end

    def to_path
      "/#{I18n.locale}#{path}"
    end

    def name_translations=(attributes)
      attributes.stringify_keys!
      primary_locale_name = attributes[I18n.default_locale.to_s]
      empty_locale_keys   = attributes.select { |_, v| v.blank? || v.empty? }.keys

      empty_locale_keys.each do |locale|
        attributes[locale] = primary_locale_name
      end

      super
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
