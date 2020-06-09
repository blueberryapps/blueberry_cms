module Types
  class ReviewsBlockType < Types::BaseObject
    implements PageBlockInterface

    field :content, String, null: true
    field :title, String, null: true
    field :reviews, [Types::ReviewType], null: false

    def reviews
      object.reviews.active
    end
  end
end
