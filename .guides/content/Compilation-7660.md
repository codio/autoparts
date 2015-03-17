Compilation is only required if your source contains source code rather than a binary package.

Once you have submitted a Pull Request and it has been accepted, then Codio will manually compile your source and upload a binary to the Codio binary store. This means that `parts install` will not run the compilation (or installation) steps, greatly speeding up the experience for the end user.

While you are the development phase, `parts install` will run the `compile` method in your `.rb` package definition file.

This step contains one or more `execute` statements that are responsible for compiling the component, should compilation be necessary.


