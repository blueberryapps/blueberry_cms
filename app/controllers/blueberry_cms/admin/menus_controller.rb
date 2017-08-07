module BlueberryCMS
  module Admin
    class MenusController < BlueberryCMS.page_admin_controller.constantize
      helper BlueberryCMS::PagesHelper

      def index
        @menus = Menu.all
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

      def edit
        @menu = Menu.find(params[:id])
      end

      def update
        @menu = Menu.find(params[:id])
        if @menu.update_attributes(menu_params)
           redirect_to(params[:continue] ? [:edit, :admin, @menu] : [:admin, :menus])
        else
          render :edit
        end
      end

      def destroy
        @menu = Menu.find(params[:id])
        @menu.destroy
        redirect_to [:admin, :menus]
      end

      private

      def menu_params
        params.require(:menu).permit!
      end

    end
  end
end
