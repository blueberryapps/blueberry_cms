module BlueberryCMS
  module Admin
    class VersionsController < BlueberryCMS.config.page_admin_controller.constantize
      before_action :find_page

      def revert
        @page.revert!(to_version)
        redirect_to [:edit, :admin, @page]
      end

      def destroy
        @page.versions.find(params[:id]).destroy
        redirect_to [:edit, :admin, @page]
      end

      private

      def find_page
        @page = Page.find(params[:page_id])
      end

      def to_version
        params[:version]
      end
    end
  end
end
