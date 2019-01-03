module BlueberryCMS
  class PageBlockDecorator < BaseDecorator
    def block_object
      is_a?(BlueberryCMS::PageBlocks::Shared) ? block.decorate : self
    end

    def computed_classes
      array = [css_class]
      array << "block--mt-#{top_margin}" if top_margin?
      array << "block--mt-#{top_margin_xs}-mobile" if top_margin_xs?

      array << "block--mb-#{bottom_margin}" if bottom_margin?
      array << "block--mb-#{bottom_margin_xs}-mobile" if bottom_margin_xs?
      array << "block--gallery-text-#{orientation}" if respond_to?(:orientation)
      array << 'block--bg-fractals white' if try(:red_background)

      if object.is_a?(BlueberryCMS::PageBlocks::VideoGallery)
        array << 'block--bg-fractals white block--videogallery'
      end

      array.join(' ')
    end

    def label
      text = if object.respond_to?(:name)
               object.name
             elsif object.respond_to?(:title)
               object.title
             elsif object.respond_to?(:content)
               h.strip_tags(object.content)
             elsif object.is_a?(BlueberryCMS::PageBlocks::Shared)
               [object.block&.page&.name, object.block&.decorate&.label].compact.join(' | ')
             end

      [object.model_name.human, h.truncate(text, length: 90)].compact.join(' - ')
    end

    def name
      process_markdown(object.name) if object.name.present?
    end

    def title
      process_markdown(object.title) if object.title.present?
    end
  end
end
