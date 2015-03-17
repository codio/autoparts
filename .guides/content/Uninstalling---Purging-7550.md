Box Parts allows a part to be uninstalled using `parts uninstall part_name` or `parts purge part_name`.

# Uninstall
The uninstallation is handled automatically by Box Parts and removes the entire package folder. 

It will not remove any data outside the package folder. If you want to perform custom actions, define them in the `post_uninstall` method.

# Purge
The purge process allows you to remove any user data that is not removed by `parts uninstall`. 
