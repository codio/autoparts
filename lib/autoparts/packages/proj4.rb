module Autoparts
  module Packages
    class Proj4 < Package
      name 'proj4'
      version '4.9.1'
      description 'PROJ.4: a Cartographic Projections library originally written by Gerald Evenden then of the USGS.'
      category Category::LIBRARIES

      source_url 'http://download.osgeo.org/proj/proj-4.9.1.tar.gz'
      source_sha1 '0bc63a41f1bdcff600d076c056f796007abf3f2f'
      source_filetype 'tar.bz2'

      depends_on  'swig'

      def name_with_version
        'proj-' + version
      end
      
      def compile
        Dir.chdir(name_with_version) do
          execute './configure', "--prefix=#{prefix_path}"
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
