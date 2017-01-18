module BlueberryCMS
  module PagesHelper
    def nested_set_options(class_or_item, mover = nil)
      if class_or_item.is_a? Array
        items = class_or_item.reject { |e| !e.root? }
      else
        class_or_item = class_or_item.roots if class_or_item.respond_to?(:scope)
        items = Array(class_or_item)
      end
      result = []
      items.each do |root|
        result += root.descendants_and_self.map do |i|
          [yield(i), i.id]
        end.compact
      end
      result
    end
  end
end
