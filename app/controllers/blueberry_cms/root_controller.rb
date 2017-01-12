module BlueberryCMS
  class RootController < ApplicationController
    def index
      redirect_to I18n.with_locale(I18n.default_locale) { Page.root.to_path }
    end
  end
end
