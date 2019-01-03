module BlueberryCMS
  class PageDecorator < BaseDecorator
    def name
      process_markdown(object.name) if object.name.present?
    end
  end
end
