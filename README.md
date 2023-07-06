# autostate

Auto apply states based on pillar

# Available states

    autostate

## autostate

Auto apply states based on pillar

```yaml
autostate:
  states:
    k8s: # state name
      enabled: true # default is true
      priority: 50  # like MX records, lower makes it happen earlier, the higher the later, default is 1000
```
