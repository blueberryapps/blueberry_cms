module BlueberryCMS
  module Admin
    class PagesController < BlueberryCMS.page_admin_controller.constantize
      include Wisper::Publisher
      helper BlueberryCMS::PagesHelper

      after_action :refresh_sitemap, only: %i(update create destroy)

      def index
        @pages = Page.roots
      end

      def new
        @page = Page.new
        @page.parent = Page.find(params[:parent_id]) if params[:parent_id]
      end

      def create
        @page = Page.new(page_params)
        if @page.save
          redirect_to(params[:continue] ? [:edit, :admin, @page] : [:admin, :pages])
        else
          render :new
        end
      end

      def edit
        @page = Page.find(params[:id])
      end

      def update
        @page = Page.find(params[:id])
        if @page.update_attributes(page_params)
          respond_to do |format|
            format.html {
              redirect_to(params[:continue] ? [:edit, :admin, @page] : [:admin, :pages])
            }
            format.js   { head :ok }
          end
        else
          respond_to do |format|
            format.html { render :edit }
            format.js   { head :unprocessable_entity }
          end
        end
      end

      def restore
        @page = Page.find(params[:id])
        @page.restore!(params[:version])
        redirect_to [:edit, :admin, @page]
      end

      def destroy
        @page = Page.find(params[:id])
        if @page.destroy
          redirect_to [:admin, :pages]
        else
          redirect_to [:admin, :pages]
        end
      end

      private

      def page_params
        params.require(:page).permit!
      end

      def refresh_sitemap
        broadcast(:refresh_sitemap)
      end
    end
  end
end
