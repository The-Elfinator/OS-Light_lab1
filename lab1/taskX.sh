#! ../../../bin/bash

man bash | tr [:space:] '\n' | sort | uniq --count | sort --numeric-sort --reverse | awk '{if (length($2) >= 4) print $2}' | head -3
