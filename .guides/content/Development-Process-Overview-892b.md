A Box Part is simply a snippet of Ruby code. You do not have to be a Ruby Ninja to write a Box Part although it will obviously make it a little bit easier.

You will have already forked the Box Parts repo on GitHub and loaded it into Codio. The following steps describe the general development process

# Preparation
1. Create a new branch (Git is already fully installed) for your new Part.
1. Create a new ruby package file in `lib/autoparts/packages`. You may want to look at the existing ones as examples.

# Coding the package
1. Define the compilation process. If you are downloading a 64-bit binary from the source, then this is not required.
1. Define the Installation process. This copies files from the extracted archive (`~/.parts/tmp/package_name_version)` to its destination (`~/.parts/packages/package_name/version)`
1. Define an optional post installation process. This allows you to perform additional operations once the package is fully installed, such as sample database, default config files, special folder creation etc.
1. Define service `start`, `stop` and `running` methods. If your package runs as a service, then you will need to define these methods in order to start or stop the service.
1. Define message `tips` method. Allows you to define the message output to the terminal window once the installation process is successfully completed.
1. Define post `uninstall` and `purge` methods. Codio will remove your installed files automatically but the `post_uninstall` and `purge` methods allow you to control the removal process.

# Testing
Now your package file is completed, you should test it and ensure that all relevant Box Parts commands are working (install, uninstall, start, stop, purge, status). You should also ensure that your installed package runs as expected.

# Publishing
At this point, your new Box Part will only work on this Codio project and will not be findable in any other project.

In order to publish it, you will need to push the repo back to GitHub and send us a [pull request](https://help.github.com/articles/creating-a-pull-request).

# Codio Steps
Your new Box Part will be checked and approved by Codio. 

We perform these checks as it us important to us that the quality of the Box Parts library is maintained at a high level and to examine them for potential security issues. Once approved,

1. We will compile your Box Part
1. We upload the binary to the Codio Box Parts binary store.
1. Merge your changes, at which point it will be available for all Codio users.

We do the above steps in order to avoid your Box Part needing to be compiled each time it is installed. This will significantly speed up the installation process.


