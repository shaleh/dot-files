# _*_ mode: makefile _*_

default: catch

catch:
	@echo "Options:"
	@echo " * install"
	@echo " * check-changes"
	@echo " * check-prereqs"

check-changes:
	sh ./check-changes.sh

check-prereqs:
	sh ./check-prereqs.sh

install: check-prereqs
	sh ./do-install.sh
