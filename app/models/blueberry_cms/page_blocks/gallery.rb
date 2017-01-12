module BlueberryCMS
  module PageBlocks
    class Gallery < PageBlock
      field :urls, type: Array, default: []

      has_many :pages

      def form_fields(form)
        form.input(:urls, input_html: { value: urls.join(', ') }) +
          form.association(:pages, collection: Page.all)
      end

      def render
        urls
      end

      def urls=(value)
        value = value.split(',').map(&:strip)
        super(value)
      end
    end
  end
end
