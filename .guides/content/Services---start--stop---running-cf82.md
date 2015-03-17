If your Part runs as a service, you will need to implement `start`, `stop` and `running` methods so your Part can be started and stopped from the command line using 

```bash
parts start part_name
parts stop part_name
```

`running` is provided so the `parts status` command can check the status of your service.


