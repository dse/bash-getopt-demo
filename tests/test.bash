#!/usr/bin/env bash

exec 2>&1

# control
bin/bash-getopt-demo

# --help
bin/bash-getopt-demo --help

# -- by itself
bin/bash-getopt-demo --verbose -- --verbose one two three

# short options
bin/bash-getopt-demo -1234
bin/bash-getopt-demo -1 -2 -3 4

# long options
bin/bash-getopt-demo --one --two --two=TWO --three=THREE

# invalid cases
bin/bash-getopt-demo -123Z
bin/bash-getopt-demo --one --zed --two

# empty strings; strings containing quotes and/or spaces
bin/bash-getopt-demo "" one "'two'" '"three"' "four five" "'six seven'" '"eight nine"'

# every printable non-alphanumeric ASCII character
bin/bash-getopt-demo ' ' '!' '"' '#' '$' '%' '&' "'" '(' ')' '*' '+' ',' '-' '.' '/'
bin/bash-getopt-demo ':' ';' '<' '=' '>' '?' '@' '[' "\\" ']' '^' '_' '`' '{' '|' '}' '~'

# control characters
bin/bash-getopt-demo $'\a' $'\b' $'\e' $'\E' $'\f' $'\n' $'\r' $'\t' $'\v'
bin/bash-getopt-demo $'\c@' $'\cA' $'\cB' $'\cC' $'\cD' $'\cE' $'\cF' $'\cG'
bin/bash-getopt-demo $'\cH' $'\cI' $'\cJ' $'\cK' $'\cL' $'\cM' $'\cN' $'\cO'
bin/bash-getopt-demo $'\cP' $'\cQ' $'\cR' $'\cS' $'\cT' $'\cU' $'\cV' $'\cW'
bin/bash-getopt-demo $'\cX' $'\cY' $'\cZ' $'\c[' $'\034' $'\c]' $'\c^' $'\c_'

# non-ASCII characters: high-bits and unicode
bin/bash-getopt-demo $'\240' $'\xa0'

