module Types
  class ArticleCategoryType < Types::BaseObject
    field :active, Boolean, null: true
    field :articles, [Types::ArticleType], null: false
    field :name, String, null: true
  end
end
