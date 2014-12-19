module Autoparts
  module Packages
    class Scons < Package
      name 'scons'
      version '2.3.4'
      description 'SCons: an Open Source software construction tool—that is, a next-generation build tool. '
      category Category::DEVELOPMENT_TOOLS

      source_url 'http://sourceforge.net/projects/scons/files/scons/2.3.4/scons-2.3.4.tar.gz'
      source_sha1 '8c55f8c15221c1b3536a041d46056ddd7fa2d23a'
      source_filetype 'tar.gz'

      def install
        Dir.chdir(name_with_version) do
          execute "/usr/bin/python", "setup.py", "install",
             "--prefix=#{prefix_path}",
             "--standalone-lib",
             # SCons gets handsy with sys.path---`scons-local` is one place it
             # will look when all is said and done.
             "--install-lib=#{lib_path}/scons-local",
             "--install-scripts=#{bin_path}",
             "--install-data=#{lib_path}",
             "--no-version-script", "--no-install-man"

             # Re-root scripts to libexec so they can import SCons and symlink back into
             # bin. Similar tactics are used in the duplicity formula.
             bin_path.children.each do |p|
               execute 'mv', p.to_s, "#{lib_path}/#{p.basename}.py"
               execute 'ln', '-s', "#{lib_path}/#{p.basename}.py", "#{bin_path}/#{p.basename}"
             end
        end
      end
    end
  end
end
