module Blueberry
  module Generators
    class UploaderGenerator < Rails::Generators::NamedBase
      def copy_uploader
        copy_file './templates/image_uploader.rb', 'apps/uploaders/image_uploader.rb'
      end
    end
  end
end
