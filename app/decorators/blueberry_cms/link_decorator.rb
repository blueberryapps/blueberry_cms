module BlueberryCMS
  class LinkDecorator < BaseDecorator
    def link_background
      "background-image: url(#{image.url(:content)})" if image?
    end

    def link_url
      page ? page.to_path : url
    end

    def link_title
      page ? page.name : title
    end
  end
end
