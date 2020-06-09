module Types
  class VideoType < Types::BaseObject
    field :job, String, null: true
    field :movieUrl, String, null: true
    field :position, Integer, null: true
    field :title, String, null: true
    field :watchLink, String, null: true
    field :embedLink, String, null: true
    field :previewUrl, String, null: true
  end
end
