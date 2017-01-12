module BlueberryCMS
  module PageBlocks
    class RichText < PageBlock
      field :content, localize: true

      def form_fields(form)
        form.input(:content) do
          form.fields_for(:content_translations) do |localized_field|
            I18n.available_locales.map do |locale|
              localized_field.input locale, input_html: { value: content_translations[locale], rows: 10, cols: 50 }, as: :text
            end.join.html_safe
          end
        end
      end

      def render(view_context)
        options = { tables: true, autolink: false, prettify: true }
        output = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options).render(content)

        Liquid::Template.parse(output).render('h' => view_context)
      end
    end
  end
end
