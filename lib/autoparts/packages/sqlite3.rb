module Autoparts
  module Packages
    class Sqlite3 < Package
      name 'sqlite3'
      version '3.8.8.3'
      description 'SQLite is an in-process library that implements a self-contained, serverless, zero-configuration, transactional SQL database engine.'
      source_url 'https://www.sqlite.org/2015/sqlite-autoconf-3080803.tar.gz'
      source_sha1 '2fe3f6226a2a08a2e814b97cd53e36bb3c597112'
      source_filetype 'tar.gz'
      category Category::DATA_STORES

      def compile
        Dir.chdir('sqlite-autoconf-3080803') do
          file = File.readlines('sqlite3.c')
          file.insert(0, "#define SQLITE_ENABLE_COLUMN_METADATA")
          File.open('sqlite3.c', 'w') do |f|
            file.each { |element| f.puts(element) }
          end
          args = [
            "--prefix=#{prefix_path}"
          ]
          execute './configure', *args
        end
      end

      def install
        Dir.chdir('sqlite-autoconf-3080803') do
          bin_path.mkpath
          execute 'make install'
        end
      end
    end
  end
end
