module BlueberryCMS
  module PageBlocks
    class Gallery < PageBlock
      field :urls, type: Array, default: []

      def urls=(value)
        value = value.split(',').map(&:strip)
        super(value)
      end
    end
  end
end
