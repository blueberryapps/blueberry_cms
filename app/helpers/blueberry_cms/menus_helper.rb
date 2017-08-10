module BlueberryCMS
  module MenusHelper
    def render_menu(slug)
      menu = BlueberryCMS::Menu.find_by(slugs: slug)
      safe_join(menu_links(menu.links)) if menu.links.any?
    end

    private

    def link(link)
      name = link.name.presence || link.page.name
      url = link.page&.to_path || link.url

      active_link_to name, anchored_link(url, link.anchor.presence), class: link.css_class.presence, active: :exclusive, target: link.new_window ? '_blank' : '_self'
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
