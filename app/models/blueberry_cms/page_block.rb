module BlueberryCMS
  class PageBlock
    include Mongoid::Document

    field :position, type: Integer

    embedded_in :page

    def self.types
      @types ||= [
        BlueberryCMS::PageBlocks::Text,
        BlueberryCMS::PageBlocks::Gallery,
        BlueberryCMS::PageBlocks::RichText
      ] + BlueberryCMS.custom_blocks
    end

    def to_partial_path
      "page_blocks/#{self.class.name.demodulize.downcase}"
    end
  end
end
