require File.join(File.dirname(__FILE__), 'php5_ext')

module Autoparts
  module Packages
    class Php5Bcmath < Php5Ext
      name 'php5-bcmath'
      description 'BC Math module for php5'
      depends_on 'php5'
      category Category::WEB_DEVELOPMENT

      def php_extension_name
        'bcmath'
      end

    end
  end
end