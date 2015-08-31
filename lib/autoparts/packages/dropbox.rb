module Autoparts
  module Packages
    class Dropbox < Package
      name 'dropbox'
      version '3.8.4'
      description 'Dropbox: a cloud synchronization service.'
      category Category::UTILITIES

      source_url 'http://www.dropbox.com/download/?plat=lnx.x86_64'
      source_sha1 '61258460e21b651a4da974557f87dc5c1c55053d'
      source_filetype 'tar.gz'

      def install
        bin_path.mkpath
        execute 'mv', extracted_archive_path + '.dropbox-dist', prefix_path
        execute 'wget', '-O', manage_script, "https://www.dropbox.com/download?dl=packages/dropbox.py"
        execute 'chmod', '+x', manage_script
        execute 'wget', '-O', bin_path + 'dropbox_init', 'https://gist.githubusercontent.com/MaximKraev/9929674/raw/3b979dbed8fc93346d87fcab87da9e3b60c513d0/dropbox_init'
        execute 'chmod', '+x', bin_path + 'dropbox_init'
      end

      def manage_script
        bin_path + 'dropbox.py'
      end
      
      def post_install
        # put dropbox on proper location
        execute 'ln', '-s', dropbox_dist, dropbox_user_dist 
      end
      
      def dropbox_dist
        prefix_path + '.dropbox-dist'
      end
      
      def dropbox_user_dist
        Path.home + '.dropbox-dist'
      end
      
      def post_uninstall        
          FileUtils.rm_rf(dropbox_user_dist) if dropbox_user_dist.symlink?
      end
      
      def stop
        execute manage_script, 'stop'
      end
      
      def start
        execute manage_script, 'start'
      end
      
      def running?
        !system( manage_script.to_s, 'running', out: '/dev/null', err: '/dev/null')
      end
      
      def purge
        FileUtils.rm_rf Path.home + '.dropbox' if File.exist?(Path.home + '.dropbox')
      end
      
      def tips
        <<-EOS.unindent
       
                   
        EOS
      end
    end
  end
end

