module Types
  class ArticlesBlockType < Types::BaseObject
    implements PageBlockInterface

    field :articles, [Types::ArticleType], null: false
    field :categories, [Types::ArticleCategoryType], null: false
  end
end
