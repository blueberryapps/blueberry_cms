module Types
  class ImageType < Types::BaseObject
    field :description, String, null: true
    field :url, String, null: true

    def url
      if object.file&.attached?
        object.file.service_url
      end
    end
  end
end
