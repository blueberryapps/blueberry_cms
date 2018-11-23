class Differ
  attr_reader :hash

  def self.css
    Diffy::CSS
  end

  def initialize(hash)
    @hash = hash
  end

  def changes
    @hash.map(&:parse_row).compact.flatten
  end

  def parse_row(row)
    key = BlueberryCMS::Page.human_attribute_name(row.first.to_sym)
    left = row.last[0] || nil
    right = row.last[1] || nil
    diff = Diffy::SplitDiff.new(left, right, format: :html)

    {
      key:   key,
      left:  diff.left,
      right: diff.right
    }
  end
end
