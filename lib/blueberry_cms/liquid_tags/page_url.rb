module BlueberryCMS
  module LiquidTags
    class PageUrl < Liquid::Tag
      def initialize(tag_name, markup, options)
        super

        @options = Hash[markup.split(',').map { |kv| kv.split(':').map(&:strip) }].symbolize_keys
      end

      def render(_context)
        page = Page.find(@options[:id])
        page.to_path
      end
    end

    Liquid::Template.register_tag('page_url'.freeze, PageUrl)
  end
end
