module BlueberryCMS
  module Trackable
    extend ActiveSupport::Concern

    included do
      include Mongoid::Delorean::Trackable

      def process_localized_attributes(klass, attrs)
        klass.localized_fields.keys.each do |name|
          if value = attrs.delete(name)
            attrs["#{name}_translations"] = value
          end
        end
        klass.embedded_relations.each do |_, metadata|
          next unless attrs.present? && attrs[metadata.key].present?

          if metadata.macro == :embeds_many
            attrs[metadata.key].each do |attr|
              process_localized_attributes(attr['_type'].constantize, attr)
            end
          else
            process_localized_attributes(metadata.klass, attrs[metadata.key])
          end
        end
      end
    end
  end
end
