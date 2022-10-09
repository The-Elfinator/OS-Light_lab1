#! ../../../bin/bash

man bash | tr [:space:] '\n' | sort | awk '{if (length($1) >= 4) print $1}' | uniq --count | sort --numeric-sort --reverse | head -3 | awk '{print $2}'
