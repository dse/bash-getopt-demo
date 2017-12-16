# bash-getopt-demo

Demonstration of how to use Bash's `getopt` builtin.

Includes a demonstration of how you can implement GNU-style long
options.  It's a bit hairy.  See [below](#support-for-long-options).

Use of an external GNU getopt executable is outside of the scope of
this project.  You probably don't want to rely on it being installed
anyway.

A *relatively* recent version of GNU Bash is required, see
[below](#bash-version).

## I Don't Recommend Doing This

I don't recommend doing this unless one of the following is the case:

- You're implementing a front-end to (or emulation of) another utility
  that supports some or all of that utility's long and short options.

- You're a masochist who's already written a shell script more than,
  say, a hundred lines long, perhaps supporting a bunch of short
  options.  Go hog wild!

Even if one of the above is the case, you should still consider
rewriting your Bash script in Perl, Python, C, aut cetera.

## Support for Long Options

Bash's `getopt` builtin only supports short options.

Purportedly.

Through a clever use of an option string including `-:`, i.e., the
program accepts the `-` option with an argument, we can effectively
implement long options.  But it's hacky.  Primarily because we must
handle option arguments and error handling manually.

You can set up long options that take no arguments.

You can set up long options that take an optional argument, in which
case the argument must be specified via `--option[=value]`, not
`--option value`.

You can set up long options that take a required argument, in which
case the argument can be specified via `--option=value` or `--option
value`.

## Limitations

Bash's `getopt` builtin does not support short options with optional
arguments.  An example of this is `git pull -r` (short for `git pull
--rebase`).  Arguments are either required or not taken at all.

Long options with optional arguments *can* be implemented but must be
specified via `--option[=value]`, not `--option value`.  This is
likely true of most *real* libraries that handle long options as well.

Specifying partial long option names is not (automatically) supported.
(I mean, you *can* manually accept `--f` or `--fo` for `--foo` if you
handle each manually.  You must manually make sure that any partial
long option names are unambiguous.)

Mixing options and arguments is not supported.  This is a limitation
of Bash's `getopt` builtin as well.

## Bash Version

This demo has been tested with GNU Bash versions 4.4.12 and 3.2.57.
It is likely to work with later versions of bash.  It may or may not
work with earlier versions of bash&mdash;I don't want to guarantee or
even halfway assure you of this.

To test your version of Bash for compatibility:

    make test

To test any particular Bash executable:

    make test BASH=/path/to/bash
