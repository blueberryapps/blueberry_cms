module BlueberryCMS
  module Admin
    class MenusController < BlueberryCMS.config.page_admin_controller.constantize
      helper BlueberryCMS::PagesHelper
      before_action :find_menu, only: %i(edit update destroy)

      def index
        @menus = Menu.ordered
      end

      def new
        @menu = Menu.new
      end

      def create
        @menu = Menu.new(menu_params)
        if @menu.save
          redirect_to(params[:continue] ? [:edit, :admin, @menu] : [:admin, :menus])
        else
          render :new
        end
      end

      def edit; end

      def update
        if @menu.update(menu_params)
           redirect_to(params[:continue] ? [:edit, :admin, @menu] : [:admin, :menus])
        else
          render :edit
        end
      end

      def destroy
        @menu.destroy
        redirect_to [:admin, :menus]
      end

      private

      def menu_params
        params.require(:menu).permit!
      end

      def find_menu
        @menu = Menu.find(params[:id])
      end
    end
  end
end
