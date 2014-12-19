module Autoparts
  module Packages
    class RBase < Package
      name 'r_base'
      version '3.1.2'
      description 'R: A free software programming language and software environment for statistical computing and graphics'
      source_url 'http://cran.stat.ucla.edu/src/base/R-3/R-3.1.2.tar.gz'
      source_sha1 '93809368e5735a630611633ac1fa99010020c5d6'
      source_filetype 'tar.gz'
      category Category::PROGRAMMING_LANGUAGES

      def compile
        Dir.chdir('R-' + version) do
         args = [
            "--prefix=#{prefix_path}",
          ]
          prefix_path.mkpath
          execute './configure', *args
          execute 'make'
        end
      end

      def install
        Dir.chdir('R-' + version) do
          execute 'make', 'install'
        end
      end
    end
  end
end
