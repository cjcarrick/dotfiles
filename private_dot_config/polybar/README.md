## File structure

## `./default` is the best bar.

### `/launch/`

- Contains config files and some launcher scripts. If there is a config file with the same name as the launcher script, use the launcher script to start polybar. Otherwise, just start the bar with:

```
polybar -c /path/to/config
```

### `/colors.ini`

- Contains the colors that all the modules use

### `/modules/`

- Contains modules that the bars use

### `/scripts/`

- Contains scripts that some of the bars need.

## More Bars

### scroll-switch

Has a few bars within it, that you can cycle through by scrolling on the label at the left.