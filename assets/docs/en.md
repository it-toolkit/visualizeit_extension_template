# Fake extension

This is the fake extension usage doc. 

This extension was created using the [extension template project](https://github.com/it-toolkit/visualizeit_extension_template),
checkout it from Github to create your own extensions.

## Available commands

### fake-command

This command shows a simple banner widget with a fixed text.

#### Usage example

```yaml
name: "..."
description: "..."
tags: ["..."]
scenes:
  - name: "..."
    extensions: ['fake-extension']
    description: "..."
    initial-state:
      - ...
    transitions:
      - fake-command
```