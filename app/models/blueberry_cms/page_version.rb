module BlueberryCMS
  class PageVersion
    include Mongoid::Document
    include Mongoid::Timestamps::Created

    field :snapshot, type: Hash

    belongs_to :page, class_name: 'BlueberryCMS::Page'
  end
end
