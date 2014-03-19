module Autoparts
  module Packages
    class GoLang < Package
      name 'go-lang'
      version '1.2'
      description 'Go: an open source programming language that makes it easy to build simple, reliable, and efficient software.'
      source_url 'https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz'
      source_sha1 '664e5025eae91412a96a10f4ed1a8af6f0f32b7d'
      source_filetype 'tar.gz'
      category Category::PROGRAMMING_LANGUAGES

      def install
        Dir.chdir('go') do
          prefix_path.mkpath
          go_packages.mkpath
          execute 'rm', '-rf', 'manual', 'INSTALL'
          execute "mv * #{prefix_path}"
        end
      end

      def env_file
        Path.env + 'go-lang'
      end

      def env_content
        <<-EOS.unindent
          export GOROOT=#{prefix_path}
          export GOPATH=#{go_packages}
        EOS
      end

      def go_packages
        prefix_path + 'gopath'
      end

      def post_install
        File.write(env_file, env_content)
      end

      def post_uninstall
        env_file.unlink if env_file.exist?
      end

      def tips
        <<-EOS.unindent

         Close and open terminal to have go-lang working after the install.
         or reload shell with
         . ./bash_profile
        EOS
      end
    end
  end
end
