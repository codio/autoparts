# Copyright (c) 2013-2014 Application Craft Ltd. Codio
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/codio/boxparts/master/LICENSE).

module Autoparts
  module Packages
    class Php5Fpm < Package
      name 'php5-fpm'
      version '5.6.12'
      description 'PHP5-FPM: an alternative PHP FastCGI implementation with some additional features (mostly) useful for heavy-loaded sites.'
      source_url 'https://php.net/get/php-5.6.12.tar.gz/from/this/mirror'
      source_sha1 '0912a4c7742752fdc1a8e77b9bf6c9202f0c3d2d'
      source_filetype 'tar.gz'
      category Category::WEB_DEVELOPMENT

      depends_on 'php5'
      depends_on 'libmcrypt'

      def compile
        Dir.chdir("php-5.6.12") do
          args = [
            "--with-mcrypt=#{get_dependency("libmcrypt").prefix_path}",
            # path
            "--prefix=#{prefix_path}",
            "--bindir=#{bin_path}",
            "--sbindir=#{bin_path}",
            "--with-config-file-path=#{Path.etc + 'php5'}",
            "--with-config-file-scan-dir=#{php5_ini_path_additional}",
            "--sysconfdir=#{Path.etc + 'php5/fpm'}",
            "--localstatedir=#{Path.var + name}",
            "--libdir=#{lib_path}",
            "--includedir=#{include_path}",
            "--datarootdir=#{share_path}/#{name}",
            "--datadir=#{share_path}/#{name}",
            "--with-mysql-sock=/tmp/mysql.sock",
            "--mandir=#{man_path}",
            "--docdir=#{doc_path}",
            # fpm
            "--enable-fpm",
            "--with-fpm-user=codio",
            "--with-fpm-group=codio",
            # features
            "--enable-opcache",
            "--enable-pdo",
            "--with-openssl",
            "--with-readline",
            "--enable-mbstring",
            "--with-mysql",
            "--with-mysqli",
            "--enable-maintainer-zts",
          ]
          execute './configure', *args
          execute 'make'
        end
      end

      def manage_script
        bin_path + 'init.php-fpm'
      end


      def install
        bin_path.mkpath
        Dir.chdir("php-5.6.12") do
          execute 'cp', 'sapi/fpm/init.d.php-fpm', manage_script
          execute 'cp', 'sapi/fpm/php-fpm', bin_path
        end
      end

      def fpm_conf_extra_dir
        fpm_conf_dir + 'fpm.d'
      end

      def fpm_conf_dir
        Path.etc + "php5" + "fpm"
      end

      def fpm_conf_path
        fpm_conf_dir + 'php-fpm.conf'
      end

      def fpm_conf_content
        <<-EOS.unindent
          include=#{fpm_conf_extra_dir}/*.conf
          [global]
          ; Pid file
          ; Note: the default prefix is /usr/local/var
          ; Default Value: none
          pid = #{Path.var}/php5-fpm/run/php-fpm.pid
        EOS
      end

      def pool_content_path
        fpm_conf_extra_dir + 'www.conf'
      end

      def pool_content
        <<-EOS.unindent
          [www]
          listen = 127.0.0.1:9000
          pm = dynamic
          pm.max_children = 5
          pm.start_servers = 1
          pm.min_spare_servers = 1
          pm.max_spare_servers = 3
        EOS
      end

      def write_config
        if fpm_conf_path.exist?
          FileUtils.cp fpm_conf_path, fpm_conf_path.to_s + '.' + Time.now.to_s
        end
        File.write(fpm_conf_path, fpm_conf_content)

        if pool_content_path.exist?
          FileUtils.cp pool_content_path, pool_content_path.to_s + '.' + Time.now.to_s
        end
        File.write(pool_content_path, pool_content)

      end

      def post_install
        fpm_conf_extra_dir.mkpath
        FileUtils.mkdir_p(Path.var + name + 'log');
        FileUtils.mkdir_p(Path.var + name + 'run');
        write_config
      end

      def start
        execute 'sh', manage_script, 'start'
      end

      def stop
        execute 'sh', manage_script, 'stop'
      end

      def running?
        pidFile = Path.var + name + "run" + "php-fpm.pid"
        if File.exists?(pidFile)
          pid = File.read(pidFile).strip
          if pid.length > 0 && `ps -o cmd= #{pid}`.include?('php')
            return true
          end
          #clean pid file if it is not right service
          File.unlink(pidFile)
        end
        false
      end

      def tips
        <<-EOS.unindent
          PHP config file is located at:
            $ #{php5_ini_path}

          PHP-FPM config file is located at:
            $ #{fpm_conf_path}

          PHP-FPM extra config files directory is located at:
            $ #{fpm_conf_extra_dir}

          To start the PHP-FPM server:
            $ parts start php5-fpm

          To stop the PHP-FPM server:
            $ parts stop php5-fpm

          Add to your nginx config php handlers:
            location ~ \.php$ {
              # fastcgi_split_path_info ^(.+\.php)(.*)$;
              fastcgi_pass   127.0.0.1:9000;
              fastcgi_index  index.php;

              fastcgi_param SCRIPT_FILENAME   $document_root$fastcgi_script_name;
              fastcgi_param PATH_TRANSLATED   $document_root$fastcgi_script_name;
              fastcgi_param PATH_INFO   $fastcgi_path_info;

              include fastcgi_params;
              fastcgi_param  QUERY_STRING     $query_string;
              fastcgi_param  REQUEST_METHOD   $request_method;
              fastcgi_param  CONTENT_TYPE     $content_type;
              fastcgi_param  CONTENT_LENGTH   $content_length;
              fastcgi_intercept_errors        on;
              fastcgi_ignore_client_abort     off;
              fastcgi_connect_timeout 60;
              fastcgi_send_timeout 180;
              fastcgi_read_timeout 180;
              fastcgi_buffer_size 128k;
              fastcgi_buffers 4 256k;
              fastcgi_busy_buffers_size 256k;
              fastcgi_temp_file_write_size 256k;
            }
        EOS
      end

      def php5_ini_path
        Path.etc + "php5" + "php.ini"
      end

      def php5_ini_path_additional
        Path.etc + "php5" + "conf.d"
      end
    end
  end
end
