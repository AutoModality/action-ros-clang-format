# action-ros-clang-format

Github Action applying the ROS Style Guide to C++ code. 

Recommended to invoke upon pull request, this will apply the code format that matches the 
[ROS C++ Style Guide](http://wiki.ros.org/CppStyleGuide) using 
[clang-format-3.8](https://releases.llvm.org/3.8.0/tools/clang/docs/ClangFormatStyleOptions.html) 
with the configuration from [davetcoleman/roscpp_code_format](https://github.com/davetcoleman/roscpp_code_format).


## Usage

```
name: Code Formatter
on:
  pull_request:
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