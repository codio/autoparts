This is where you specify the remote location of the component you want to install. It can be a binary or source code.

- `source_url` - the url of the component
- `source_sha1` '06e1d856cfb1f98844ef92af47d4f4f7036ef294'
- `source_filetype` - should be `tar.gz` or `zip`

# Understanding the process
When you run `parts install package_name` Codio checks whether the component (version specific) exists in the Codio binary store. If it exists, then it will be downloaded and installed (in the `~/.parts/packages/package_name/version`) without executing the Compilation or Installation steps (described in upcoming sections).

Your package will only be present in the binary store once we have approved your Pull request, as described in the 'Development Process Overview' section, and then uploaded your compiled binary to the Codio binary store.

During the development of your new Box Parts package, it will not be present in the Codio binary store and so `parts install package_name` will first run the Compilation step followed by the Installation step. 


# Selecting a fixed version
It is advisable to specify a fixed version of a component rather than the latest build. If you select a latest build, the file will get updated and as such the SHA1 hash will change and your installation will fail.

Some components will provide a directory structure where specific versions are clearly listed. Other components may be available as Git `tags`, in which case you would select the tag in GitHub or any other platform and then look for the Download URL.

# SHA1 hash
If the component does not list the SHA1 hash for you then you will need to manually download the component and calculate the hash yourself.

You can do this as follows from the command line.

```bash
cd ~
mkdir tmp
cd tmp
wget component_url
sha1sum downloaded_filename
```

You will then be shown the SHA1 value, which you can copy and paste into your file.

