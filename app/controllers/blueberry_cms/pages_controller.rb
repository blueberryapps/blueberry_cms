module BlueberryCMS
  class PagesController < ApplicationController
    class LiquidViewContext
      def initialize(context); @context = context; end
      def to_liquid; @context; end
    end

    around_action :set_locale
    helper_method :liquid_view_context

    def show
      @page = Page.find_by(path: "/#{params[:path]}")
    end

    private

    def liquid_view_context
      @liquid_view_context = LiquidViewContext.new(view_context)
    end

    def set_locale
      I18n.with_locale(params[:locale]) do
        yield
      end
    end
  end
end
