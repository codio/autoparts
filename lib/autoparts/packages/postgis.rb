module Autoparts
  module Packages
    class Postgis < Package
      name 'postgis'
      version '2.1.8'
      description 'PostGIS: a spatial database extender for PostgreSQL object-relational database.'
      category Category::LIBRARIES

      source_url 'http://download.osgeo.org/postgis/source/postgis-2.1.8.tar.gz'
      source_sha1 'cfb3b7a01449fbbdb3a052002cebd23537ea6c93'
      source_filetype 'tar.gz'

      depends_on 'postgresql'
      depends_on 'geos'
      depends_on 'proj4'
      depends_on 'gdal'
      
      def compile
        Dir.chdir(name_with_version) do
          args = [
            "--prefix=#{prefix_path}"
          ]

          execute './configure', *args
          execute 'make'
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
