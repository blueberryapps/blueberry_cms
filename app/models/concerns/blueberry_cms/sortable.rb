module BlueberryCMS
  module Sortable
    extend ActiveSupport::Concern

    included do
      before_save :update_position
    end

    private

    def update_position
      if position_changed? && persisted?
        position_was = attribute_was('position') || 0

        if position_was < position
          siblings.where(:position.gt => position_was, :position.lte => position)
                  .inc(position: -1)
        else
          siblings.where(:position.gte => position, :position.lt => position_was)
                  .inc(position: 1)
        end
      end
    end
  end
end
