module BlueberryCMS
  class Question
    include Mongoid::Document

    field :answer,   type: String
    field :position, type: Integer
    field :question, type: String

    embedded_in :faq, class_name: 'BlueberryCMS::PageBlocks::FAQ'
  end
end
