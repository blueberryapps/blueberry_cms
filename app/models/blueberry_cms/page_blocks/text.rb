module BlueberryCMS
  module PageBlocks
    class Text < PageBlock
      field :content, localize: true

      def form_fields(form)
        form.input(:content) do
          form.fields_for(:content_translations) do |localized_field|
            I18n.available_locales.map do |locale|
              localized_field.input locale, input_html: { value: content_translations[locale] }
            end.join.html_safe
          end
        end
      end

      def render
        content
      end
    end
  end
end
