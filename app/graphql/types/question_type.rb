module Types
  class QuestionType < Types::BaseObject
    field :answer, String, null: true
    field :question, String, null: true
  end
end
