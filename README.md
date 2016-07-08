Component File Check
===
A linter for scss-lint (https://github.com/brigade/scss-lint). Warns when a class name cannot be matched to a file name. Useful if you organize your css into modules, and put each module into a file named for that module. 

Config
---

linters:

    ComponentFileCheck:
        # set to true to enable
        enabled: true
        # files to search
        glob: 'foo/bar/**/*.scss'
        # optional list of classes/components to ignore
        ignoredComponents: [foo, bar]

Use
---
This linter is currently not available as a Gem. To use it, place /lib/ComponentFileCheck.rb in a folder on your system, then add that folder to your .scss-lint.yml file as follows

    plugin_directories: ['/foo/bar']
