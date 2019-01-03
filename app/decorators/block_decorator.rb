class BlockDecorator < Draper::Decorator
  delegate_all

  def css_class
    array = [object.css_class]
    array << 'block--centered-reverse' if right?
    array.join(' ')
  end

  def process_markdown(string)
    h.sanitize Markdown.new(string).to_html, tags: %w(strong em)
  end
end
