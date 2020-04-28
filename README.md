# ROS C++ Style Guide Github Action

Github Action applying the ROS Style Guide to C++ code. 

This Action will format the code to match the 
[ROS C++ Style Guide](http://wiki.ros.org/CppStyleGuide) using 
[clang-format-3.8](https://releases.llvm.org/3.8.0/tools/clang/docs/ClangFormatStyleOptions.html) 
with the configuration from [davetcoleman/roscpp_code_format](https://github.com/davetcoleman/roscpp_code_format).

It is required to add this to `formatter.yml` that runs on `push` after a build is successful and ready for a pull request.
Github Actions triggered by pull request unfortunately have a detached head and do not allow committing to the same branch.

# Features
* formats C++ code to match the ROS Style guide
* Commits modified code to branch
* Supports push triggers (not pull requests)
* Future Enhancement: Pass custom `.clang-format` file

## Usage

```
name: Code Formatter
on:
  push:
jobs:
  clang-format:
      runs-on: ubuntu-latest
      steps:
      - uses: actions/checkout@v2
      - uses: AutoModality/action-ros-clang-format@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### Optional

From action.yml

```
inputs:
  author-name:
    description: 'The name that will appear in commits when changes needs to be committed'
    required: false
    default: Format Bot
  author-email:
    description: 'The email address that will appear in commits when changes needs to be committed'
    required: false
    default: formatter@github.bot
  commit-message:
    description: 'The commit message used when changes needs to be committed'
    required: false
    default: 'style: Applied ROS C++ Style Guide'
```


