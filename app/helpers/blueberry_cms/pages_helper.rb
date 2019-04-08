module BlueberryCMS
  module PagesHelper
    def block_visible?(object)
      object.new_record? || object.errors.any?
    end

    def nested_set_options(klass, current_page = nil)
      @cache ||= {}
      @cache[klass] ||= klass.traverse(:depth_first)
      @cache[klass].map do |page|
        ["#{'–' * page.depth} #{page.name}", page.id, disabled: page == current_page ]
      end
    end
  end
end
