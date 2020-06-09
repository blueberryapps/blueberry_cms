module Types
  class PageType < Types::BaseObject
    field :id, ID, null: false
    field :metaDescription, String, null: true
    field :metaKeywords, String, null: true
    field :metaTitle, String, null: true
    field :name, String, null: true
    field :path, String, null: true
    field :plainPath, String, null: true
    field :showInFooter, Boolean, null: true
    field :showInMenu, Boolean, null: true
    field :slug, String, null: true
    field :blocks, [PageBlockInterface], null: false

    def path
      object.to_path
    end

    def plain_path
      object.path
    end
  end
end
