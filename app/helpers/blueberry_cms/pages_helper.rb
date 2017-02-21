module BlueberryCMS
  module PagesHelper
    def nested_set_options(klass, current_page = nil)
      klass.traverse(:depth_first).map do |page|
        ["#{'–' * page.depth} #{page.name}", page.id, disabled: page == current_page ]
      end
    end
  end
end
