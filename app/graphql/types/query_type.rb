module Types
  class QueryType < Types::BaseObject
    field(:homepage, Types::PageType, null: true, description: 'Homepage') do
      argument :locale, String, required: true, prepare: ->(locale, ctx) do
        I18n.locale = locale.to_sym
      end
    end

    field(
      :pages,
      [Types::PageType],
      null: false,
      description: 'List of active Pages'
    ) do
      argument :locale, String, required: true, prepare: ->(locale, ctx) do
        I18n.locale = locale.to_sym
      end
    end

    field(
      :page,
      Types::PageType,
      null: true,
      description: 'Specific Page, found by its path'
    ) do
      argument :locale, String, required: true, prepare: ->(locale, ctx) do
        I18n.locale = locale.to_sym
      end
      argument :path, String, required: true
    end

    field(
      :menu,
      Types::MenuType,
      null: true,
      description: 'Specific Menu, found by its slug'
    ) do
      argument :locale, String, required: true, prepare: ->(locale, ctx) do
        I18n.locale = locale.to_sym
      end
      argument :slug, String, required: true
    end

    def homepage(locale:)
      BlueberryCMS::Page.find_by!(path: '/')
    end

    def menu(locale:, slug:)
      BlueberryCMS::Menu.find_by(slugs: slug)
    end

    def pages(locale:)
      BlueberryCMS::Page.active
    end

    def page(locale:, path:)
      BlueberryCMS::Page.find_by!(path: path)
    end
  end
end
