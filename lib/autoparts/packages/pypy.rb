module Autoparts
  module Packages
    class PyPy < Package
      name 'pypy'
      version '2.4.0'
      description 'PyPy: A Python interpreter and JIT written in Python'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'https://bitbucket.org/pypy/pypy/downloads/pypy-2.4.0-linux64.tar.bz2'
      source_sha1 'c362247226f1cde2b957ab5e885f41475381553b'
      source_filetype 'tar.bz2'

      def install
        prefix_path.mkpath
        FileUtils.cp_r 'pypy-2.4.0-linux64/.', prefix_path
        FileUtils.rm_rf 'pypy-2.4.0-linux64/.'
      end  
    end
  end
end
