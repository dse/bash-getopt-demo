BASH = bash
default:
	@ >&2 echo "No default."
	@ >&2 echo "    make test [BASH=/path/to/bash]"
	@ >&2 echo "    make test2 [BASH=/path/to/bash]"
test:
	@ $(BASH) --version
	@ $(BASH) tests/test.bash | diff tests/test.out -
test2:
	@ $(BASH) --version
	@ $(BASH) tests/test2.bash | diff tests/test2.out -
.PHONY: default test
