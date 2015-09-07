# Copyright (c) 2013-2014 Application Craft Ltd. Codio
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/codio/boxparts/master/LICENSE).

require 'active_support/concern'

module Autoparts
  module Packages
    module Php5Ext
      extend ActiveSupport::Concern

      included do
        self.version '5.6.12'
        self.source_url 'https://php.net/get/php-5.6.12.tar.gz/from/this/mirror'
        self.source_sha1 '0912a4c7742752fdc1a8e77b9bf6c9202f0c3d2d'
        self.source_filetype  'tar.gz'
        self.depends_on 'php5'

        def php_extension_dir
          "php-5.6.12/ext/" + php_extension_name
        end


        def php_compile_args
          [ ]
        end

        def compile
          Dir.chdir(php_extension_dir) do
            unless File.exist?('config.m4')
              Dir.glob('config?.m4').each { |f| execute 'cp', f, 'config.m4' }
            end

            execute 'phpize'
            args = php_compile_args
            args.push('--enable-maintainer-zts')
            execute './configure', *args
            execute 'make'
          end
        end

        def config_name
          "#{php_extension_name}.ini"
        end

        def extension_config_path
          get_dependency("php5").php5_ini_path_additional + config_name
        end

        def extension_config
          <<-EOF.unindent
          extension=#{prefix_path}/#{php_extension_name}.so
          EOF
        end

        def install
          prefix_path.mkpath
          Dir.chdir("#{php_extension_dir}/modules") do
            execute 'cp', php_extension_name + '.so', prefix_path
            execute 'cp', php_extension_name + '.la', prefix_path
          end
        end

        def post_install
            File.open(extension_config_path, "w") { |f| f.write extension_config }
        end

        def post_uninstall
          extension_config_path.unlink if extension_config_path.exist?
        end
      end
    end
  end
end
