module Autoparts
  module Packages
    class ImageMagick < Package
      name 'image_magick'
      version '6.9.0-0'
      description 'ImageMagick: a software suite to create, edit, compose, or convert bitmap images.'
      category Category::UTILITIES

      source_url 'http://www.imagemagick.org/download/ImageMagick-6.9.0-0.tar.gz'
      source_sha1 '4646cb9b377308d17cd78c3c4ff144c0674b31bc'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir("ImageMagick-#{version}") do
          args = [
            "--prefix=#{prefix_path}"
          ]
          execute './configure', *args
          execute 'make'
        end
      end

      def install
        Dir.chdir("ImageMagick-#{version}") do
          execute 'make', 'install'
        end
      end

      def image_magick_path
        bin_path + 'image_magick'
      end
    end
  end
end
