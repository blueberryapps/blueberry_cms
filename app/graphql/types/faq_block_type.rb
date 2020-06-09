module Types
  class FAQBlockType < Types::BaseObject
    implements PageBlockInterface

    field :title, String, null: true
    field :faqs, [Types::QuestionType], null: false
  end
end
