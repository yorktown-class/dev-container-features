set -e

VERSION=$(bazel --version | grep -Po "(\d+\.)+\d+")
echo get bazel version: $VERSION
curl -L https://raw.githubusercontent.com/bazelbuild/bazel/$VERSION/scripts/bazel-complete-header.bash -o /etc/bash_completion.d/bazel.bash 
curl -L https://raw.githubusercontent.com/bazelbuild/bazel/$VERSION/scripts/bazel-complete-template.bash >> /etc/bash_completion.d/bazel.bash
bazel help completion >> /etc/bash_completion.d/bazel.bash
cat /etc/bash_completion.d/bazel.bash
