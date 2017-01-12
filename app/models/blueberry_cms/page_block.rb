module BlueberryCMS
  class PageBlock
    include Mongoid::Document

    embedded_in :page

    def self.types
      @types ||= [
        BlueberryCMS::PageBlocks::Text,
        BlueberryCMS::PageBlocks::Gallery,
        BlueberryCMS::PageBlocks::RichText
      ]
    end

    def form_fields(form)
      raise NotImplementedError
    end

    def render
      raise NotImplementedError
    end
  end
end
