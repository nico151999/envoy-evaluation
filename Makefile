SKAFFOLD_INSTALL_LOCATION:=$(shell which skaffold)

ifneq (,$(wildcard ./.env))
    include .env
    export
endif

.PHONY: skaffold-dev
skaffold-dev:
	$(SKAFFOLD_INSTALL_LOCATION) dev

.PHONY: skaffold-run
skaffold-run:
	$(SKAFFOLD_INSTALL_LOCATION) run

.PHONY: skaffold-delete
skaffold-delete:
	$(SKAFFOLD_INSTALL_LOCATION) delete