module Autoparts
  module Packages
    class Cabal < Package
      name 'cabal'
      version '1.20.0.2'
      description 'Cabal: A system for building and packaging Haskell libraries and programs'
      category Category::DEVELOPMENT_TOOLS

      source_url 'http://www.haskell.org/cabal/release/cabal-install-1.20.0.2/cabal-install-1.20.0.2.tar.gz'
      source_sha1 'e9b3843270b8f5969a4e1205263e59439bc35692'
      source_filetype 'tar.gz'

      depends_on 'ghc'

      def compile
        Dir.chdir('cabal-install-1.20.0.2') do
          execute "./bootstrap.sh"
          execute "mkdir -p #{bin_path} && cp ~/.cabal/bin/cabal #{bin_path}"
        end
      end

      def tips
        <<-EOS.unindent
          Run "cabal update" after installing
            $ cabal update

         Close and open terminal to have go-lang working after the install.
         or reload shell with
         . ~/.bash_profile
        EOS
      end

      def post_install
        File.write(env_file, env_content)
      end

      def post_uninstall
        env_file.unlink if env_file.exist?
      end

      def env_file
        Path.env + 'cabal'
      end

      def env_content
        <<-EOS.unindent
          export PATH="$HOME/.cabal/bin:$PATH"
        EOS
      end
    end
  end
end
