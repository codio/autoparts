Box Parts provides several helper methods to let you reference paths, names, versions etc.

If you want to see all methods, please [click here](open_file lib/autoparts/package.rb).

When you install a package, your files will end up in the following folder structure

~/.parts/packages/package_name/version

# Package Methods
It is worth you being aware of the following methods

- **user** : the Codio user name
- **name_with_version** : package_name-version
- **extracted_archive_path** : path to the temporary folder where the downloaded archive was extracted
- **prefix_path** : destination folder for the installed package
- **etc_path** : the path to your `etc` folder
- **bin_path** :
- **sbin_path** :
- **include_path** :
- **lib_path** :
- **libexec_path** : 
- **share_path** :

# Global Path Methods
You can also reference Box Parts system paths that are not a part of your package to store user related data. Anything placed in these paths will not be removed automatically when you run `parts uninstall`.

- **Path.bin**
- **Path.etc**
- **Path.lib**
- **Path.tmp**
- **Path.var**

To see all available Paths, [click here](open_file lib/autoparts/path.rb)

    