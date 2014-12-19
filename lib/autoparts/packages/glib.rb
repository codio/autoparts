module Autoparts
  module Packages
    class Glib < Package
      name 'glib'
      version '2.43.2'
      description 'GLib: a general-purpose utility library, which provides many useful data types, macros, type conversions, string utilities, file utilities, a mainloop abstraction, and so on.'
      category Category::LIBRARIES

      depends_on 'libffi'

      source_url 'http://ftp.acc.umu.se/pub/gnome/sources/glib/2.43/glib-2.43.2.tar.xz'
      source_sha1 'db984c954e85f164d2e2f7968b9f3bb1811e4127'
      source_filetype 'tar.xz'

      def compile
        Dir.chdir(name_with_version) do
          args = [
            "--prefix=#{prefix_path}",  
            "--disable-maintainer-mode",
            "--disable-dependency-tracking",
            "--disable-silent-rules",
#           "--disable-dtrace",
            "--disable-libelf",
          ]

          execute './configure', *args
          execute 'make -j1'
        end
      end


      def install
        Dir.chdir(name_with_version) do
          execute 'make install'
        end
      end
    end
  end
end
