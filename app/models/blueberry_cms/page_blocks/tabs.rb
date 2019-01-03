module BlueberryCMS
  module PageBlocks
    class Tabs < PageBlock
      embeds_many :tabs, class_name:        'BlueberryCMS::Tab',
                         cascade_callbacks: true,
                         order:             :position.asc

      accepts_nested_attributes_for :tabs, allow_destroy: true

      def name
        tabs.map do |tab|
          tab.title.truncate(30)
        end.join(', ')
      end
    end
  end
end
