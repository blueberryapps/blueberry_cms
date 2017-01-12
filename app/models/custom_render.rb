class CustomRender < Redcarpet::Render::HTML
  def link(link, title, content)
    if link =~ /^[a-z0-9]{24}$/
      page = Page.find(link)
      title ||= page.title
      content ||= page.title
      link = page.path
    end
    "<a href='#{link}'>#{content}</a>"
  end
end
