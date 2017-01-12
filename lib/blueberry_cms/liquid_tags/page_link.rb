module BlueberryCMS
  module LiquidTags
    class PageLink < Liquid::Tag
      def initialize(tag_name, markup, options)
        super

        @options = Hash[markup.split(',').map { |kv| kv.split(':').map(&:strip) }].symbolize_keys
      end

      def render(context)
        page = Page.find(@options[:id])
        context['h'].link_to @options[:title].presence || page.name, page.to_path
      end
    end

    Liquid::Template.register_tag('page_link'.freeze, PageLink)
  end
end
