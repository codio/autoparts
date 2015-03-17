If your Box Part requires other Box Parts to be installed before your Part is installed then you specify it here.

- `depends_on` followed by a space delimited list of Box Parts

If you need to refer to this dependency in any of your package methods (most likely the compilation step) then you may find the following helper useful 

```ruby
get_dependency("dependent_package_name").prefix_path
```

This will only work if the dependent package is defined with `depends_on`.