module BlueberryCMS
  module MenusHelper
    def render_menu(slug)
      menu = BlueberryCMS::Menu.find_by(slugs: slug)
      safe_join(menu_links(menu.links)) if menu.links.any?
    end

    private

    def link(link)
      if link.page
        link_to link.page.name, link.page.to_path, class: link.css_class.presence, anchor: link.anchor.presence
      else
        link_to link.name, link.url, class: link.css_class.presence, anchor: link.anchor.presence
      end
    end

    def menu_links(links)
      links.map do |link|
        content_tag(:li, link(link))
      end
    end
  end
end
