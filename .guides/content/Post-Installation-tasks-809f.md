The Post Installation step is called once the full installation is completed and carries out tasks such as installing a default database or modifying configuration files.

# Where to put your config files
Once your installation is complete, 

- Configuration files should be placed in `Path.etc` (e.g. `~/.parts/etc`) or `Path.etc + name` (e.g. `~/.parts/etc/postgresql`).
- Data files (e.g. database files) should be placed in `Path.var + name` (e.g. `~/.parts/var/postgresql`).
- Log files should be placed in `Path.var + 'log' + "# {name}.log"` (e.g. `~/.parts/var/log/postgresql.log`)