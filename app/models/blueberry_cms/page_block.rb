module BlueberryCMS
  class PageBlock
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic

    MARGINS = %w[0 xs sm md lg xl].freeze

    field :active,           type: Boolean
    field :block_anchor,     type: String
    field :bottom_margin,    type: String
    field :bottom_margin_xs, type: String
    field :css_class
    field :position,         type: Integer, default: 0
    field :shared,           type: Boolean
    field :top_margin,       type: String
    field :top_margin_xs,    type: String

    embedded_in :page

    scope :active, -> { where(active: true) }

    def used_for_sharing?
      BlueberryCMS::Page.where('blocks.block_id' => _id).any?
    end

    set_callback(:destroy, :before) do
      if used_for_sharing?
        page.errors.add(:base, :'restrict_dependent_destroy.is_shared')
        throw(:abort)
      end
    end

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
