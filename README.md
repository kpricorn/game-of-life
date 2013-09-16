# Setup

    # install dev dependencies from package.json
    npm install
    # install the grunt-cli package globally
    npm install -g grunt-cli

# Tests

    # run node-jasmine with grunt
    grunt

The default task compiles the coffee files and runs the jasmine specs

# Build

    # compile coffee sources, run concat/minifier
    grunt prepare

The build (standard and minified version) can be found in the `dist`
folder.

# Release

    # Bump version, git add/commit/push
    # grunt release:<level>
    grunt release:patch

e.g. Patch release (see [1] for more information)

[1]: https://github.com/geddski/grunt-release
