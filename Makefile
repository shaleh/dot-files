# _*_ mode: makefile _*_

default: catch

catch:
	@echo "Options:"
	@echo " * install"
	@echo " * check-changes"
	@echo " * check-prereqs"

check-changes:
	./check-changes.sh

check-prereqs:
	./check-prereqs.sh

install: check-prereqs
	./do-install.sh
