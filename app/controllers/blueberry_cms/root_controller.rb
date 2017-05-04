module BlueberryCMS
  class RootController < ApplicationController
    def index
      page = BlueberryCMS::Page.find_by!(path: "/#{params[:path]}")
      redirect_to I18n.with_locale(I18n.default_locale) { page.to_path }
    end
  end
end
