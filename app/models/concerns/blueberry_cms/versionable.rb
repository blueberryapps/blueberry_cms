module BlueberryCMS
  module Versionable
    extend ActiveSupport::Concern
    NO_VERSION_FIELDS = %w(_id versions position)

    included do
      has_many :versions, class_name: 'BlueberryCMS::PageVersion',
                          order:      :created_at.asc,
                          dependent:  :delete

      before_update :store_version#, if: :changed?
    end

    def preview!(version_id)
      instance_variable_set('@attributes', get_version(version_id))
      self
    end

    def restore!(version_id = nil)
      version_id ||= versions.last.id

      store_version

      collection.find_one_and_update({ _id: id }, get_version(version_id))

      reload
    end

    private

    def get_version(version_id)
      versions.find(version_id)[:snapshot]
    rescue Mongoid::Errors::DocumentNotFound
      raise "Version #{version_id} not found"
    end

    def store_version
      BlueberryCMS::PageVersion.create(
        page_id:  id,
        snapshot: stored_version_attributes
      )
    end

    def stored_version_attributes
      collection.find(_id: id).first.except(*NO_VERSION_FIELDS)
    end
  end
end
