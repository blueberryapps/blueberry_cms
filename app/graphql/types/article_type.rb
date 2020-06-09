module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :article_categories, [Types::ArticleCategoryType], null: false
    field :content, String, null: true
    field :image, Types::ImageType, null: true
    field :images, [Types::ImageType], null: true
    field :path, String, null: true
    field :perex, String, null: true
    field :publishedOn, GraphQL::Types::ISO8601Date, null: true
    field :slug, String, null: true
    field :title, String, null: true

    def path
      "/#{I18n.locale}/#{object.slug}"
    end
  end
end
