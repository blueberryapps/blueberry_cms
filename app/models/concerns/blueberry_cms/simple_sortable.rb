module BlueberryCMS
  module SimpleSortable
    extend ActiveSupport::Concern

    included do
      before_save :update_position
    end

    private

    def update_position
      if position_changed? && persisted?
        position_was = attribute_was('position') || 0
        siblings = links

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


def update_position
  if position_changed?
    count = blockable.blocks.count

    self.position = 0         if position < 0
    self.position = count - 1 if position >= count

    if position_was < position
      self.class.where('position > ?', position_was).
                 where('position <= ?', position).
                 update_all('position = position - 1')
    else
      self.class.where('position >= ?', position).
                 where('position < ?', position_was).
                 update_all('position = position + 1')
    end
  end
end
