module BlueberryCMS
  module PageBlocks
    class Shared < PageBlock
      field :block_id, type: BSON::ObjectId

      def self.avaible_shared_blocks_for_select
        blocks = BlueberryCMS::Page.all.map(&:blocks).flatten.select(&:shared)

        blocks.map do |block|
          [[block.page.name, block.label].join(' | '), block.id]
        end
      end

      def page_by_block
        return nil unless block_id?
        BlueberryCMS::Page.find_by('blocks._id' => block_id)
      end

      def block
        return nil unless page_by_block
        page_by_block&.blocks&.find(block_id)
      end
    end
  end
end
