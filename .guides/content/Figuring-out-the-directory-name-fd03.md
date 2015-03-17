Before the compilation step, your source is downloaded from the specified URL and unpacked to a temporary location. That location will be the current working directory for the `compilation` and `installation` methods.

You may want to specify the directory name of the unpacked component. You will find code like this in a typical Parts package method

```bash
Dir.chdir('mysql-5.6.13') do
```

To figure out what the correct directory name is, the easiest thing to do is to download the component, then unpack it and review the folder structure.

```bash
cd ~
mkdir tmp
cd tmp
wget component_url
tar -zxvf component.tar.gz
ls -al
```

