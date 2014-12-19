module Autoparts
  module Packages
    class FreePascal < Package
      name 'freepascal'
      version '2.6.4'
      description 'Free Pascal: An open source Pascal compiler for Pascal and Object Pascal'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'http://sourceforge.net/projects/freepascal/files/Linux/2.6.4/fpc-2.6.4.x86_64-linux.tar'
      source_sha1 'bfba781eac7177e6bf36522859cc5ca7251d6f5e'
      source_filetype 'tar'

      def install
        Dir.chdir('fpc-2.6.4.x86_64-linux') do
          prefix_path.mkpath
          File.open('answers.sh', 'w') { |f| f << answers_file }
          execute 'chmod', '+x', 'answers.sh'
          # disable samplecfg script
          execute 'sed', '-i', "s|\"\$LIBDIR/samplecfg\"|echo 'skipping samplecfg' # \"\$LIBDIR/samplecfg\"|g", './install.sh'
          execute './answers.sh | ./install.sh'
        end
      end

      def post_install
        # run samplecfg script
        fpc_lib_path = lib_path + 'fpc' + version
        execute (fpc_lib_path + 'samplecfg'), fpc_lib_path
      end

      def purge
        execute 'rm', '-f', "#{Path.home}/.fpc.cfg"
        execute 'rm', '-f', "#{Path.home}/.fpc.bak"
        execute 'rm', '-f', "#{Path.home}/fp.dir"
        execute 'rm', '-f', "#{Path.home}/.config/fppkg.cfg"
        execute 'rm', '-f', "#{Path.home}/.config/fppkg.bak"
        execute 'rm', '-rf', "#{Path.home}/.fppkg"
      end

      def answers_file
        <<-EOF.unindent
            echo #{prefix_path} # Install Prefix
            echo Y # Textmode IDE
            echo Y # FCL
            echo Y # packages
            echo N # documentation
            echo N # demos
        EOF
      end

      def tips
        <<-EOS.unindent
          To start the ide:
            $ fp

          To use the command line compiler:
            $ fpc
        EOS
      end
    end
  end
end
