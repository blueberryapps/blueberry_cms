module BlueberryCMS
  # Model which includes this concern gets scoped by scope set on engine. This
  # includes all mongo queries, done by +default_scope+.
  module Scopable
    extend ActiveSupport::Concern

    included do
      before_validation :set_scope

      field :scope

      default_scope lambda {
        BlueberryCMS.scope ? where(scope: BlueberryCMS.scope) : scoped
      }
    end

    private

    def set_scope
      self.scope ||= BlueberryCMS.scope
    end
  end
end
