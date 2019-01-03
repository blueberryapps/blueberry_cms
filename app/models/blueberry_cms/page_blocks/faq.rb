module BlueberryCMS
  module PageBlocks
    class FAQ < PageBlock
      field :title, localize: true

      embeds_many :questions, class_name:        'BlueberryCMS::Question',
                              cascade_callbacks: true,
                              order:             :position.asc

      accepts_nested_attributes_for :questions, allow_destroy: true

      def name
        questions.map do |question|
          question.question.truncate(30)
        end.join(', ')
      end
    end
  end
end
