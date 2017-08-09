module BlueberryCMS
  module MenusHelper
    def render_menu(slug)
      menu = BlueberryCMS::Menu.find_by(slugs: slug)
      safe_join(menu_links(menu.links)) if menu.links.any?
    end

    private

    def link(link)
      if link.page
        active_link_to link.page.name, anchored_link(link.page.to_path, link.anchor.presence), class: link.css_class.presence, active: :exclusive
      else
        active_link_to link.name, anchored_link(link.url, link.anchor.presence), class: link.css_class.presence, active: :exclusive
      end
    end

    def menu_links(links)
      links.map do |link|
        content_tag(:li, link(link))
      end
    end

    def anchored_link(link, anchor)
      [link, anchor.presence].compact.join('#')
    end
  end
end
