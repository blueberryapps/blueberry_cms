module BlueberryCMS
  class PageBlock
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    include BlueberryCMS::Scopable

    field :position, type: Integer
    field :css_class

    embedded_in :page

    def self.types
      @types ||= [
        BlueberryCMS::PageBlocks::Gallery,
        BlueberryCMS::PageBlocks::RichText
      ] + BlueberryCMS.custom_blocks
    end

    def to_partial_path
      "page_blocks/#{self.class.name.demodulize.downcase}"
    end
  end
end
