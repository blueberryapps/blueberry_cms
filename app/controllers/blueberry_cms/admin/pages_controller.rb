module BlueberryCMS
  module Admin
    class PagesController < BlueberryCMS.page_admin_controller.constantize
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
          redirect_to [:admin, :pages]
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
          redirect_to [:admin, :pages]
        else
          render :edit
        end
      end

      def destroy
        @page = Page.find(params[:id])
        @page.destroy
        redirect_to [:admin, :pages]
      end

      private

      def page_params
        params.
          require(:page).
          permit(
            :parent_id, :name, :show_in_menu,
            slug_translations: [:cs, :en],
            blocks_attributes: [
              :_destroy, :id, :_type, :urls,
              page_ids: [],
              content_translations: [:cs, :en],
            ]
          )
      end
    end
  end
end
