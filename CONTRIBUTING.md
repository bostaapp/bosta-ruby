# Contributing

We are open to, and grateful for, any contributions made by the community. By contributing to Bosta Ruby SDK, you agree to abide by the [code of conduct](https://github.com/bostaapp/bosta-ruby/blob/master/CONTRIBUTING.md).


# Code Style

- Consider the best practices and rules recommended by the
  [Ruby Community Style Guide](https://github.com/bbatsov/ruby-style-guide).
- To check style linting run the following command:
    ```bash
    gem install rubocop

    rubocop {source_file_or_directory}

    ```
- You can auto-correct offenses with the following command:
    ```bash
     rubocop -a
    ```

### Commit Messages

Commit messages should be verb based, using the following pattern:

- `Fixing ...`
- `Adding ...`
- `Updating ...`
- `Removing ...`

### Documentation

Please update the [docs](README.md) accordingly so that there are no discrepancies between the API and the documentation.

### Developing

- `bundle install` install dependencies

### Releasing

- **Consider our release cycle** - We try to follow [SemVer v2.0.0](http://semver.org/). Randomly breaking public APIs is not an option.

- **Create feature branches** - Don't ask us to pull from your master branch.

- **One pull request per feature** - If you want to do more than one thing, send multiple pull requests.

- **Send coherent history** - Make sure each individual commit in your pull request is meaningful. If you had to make multiple intermediate commits while developing, please [squash them](http://www.git-scm.com/book/en/v2/Git-Tools-Rewriting-History#Changing-Multiple-Commit-Messages) before submitting.

