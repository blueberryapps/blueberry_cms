module BlueberryCMS
  class Question
    include Mongoid::Document

    field :answer,   type: String, localize: true
    field :position, type: Integer
    field :question, type: String, localize: true

    embedded_in :faq, class_name: 'BlueberryCMS::PageBlocks::FAQ'
  end
end
