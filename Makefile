
.DEFAULT_GOAL := help
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
proj_dir := $(dir $(mkfile_path))
image := testsite:latest
template := $(proj_dir)000-default.conf.template
secret_file := $(proj_dir)client_secret.txt
site_conf := $(proj_dir)000-default.conf

.PHONY: run build

$(site_conf): $(template) $(secret_file)
	@sed -e "s/{{ CLIENT_SECRET }}/$$(cat $(secret_file))/g" $(template) > $(site_conf)

help:
	@echo "'make build': Create docker image.";
	@echo "'make run': Run docker image.";
	@echo "'make': This help.";

build: $(site_conf)
	@cd $(proj_dir) && docker build -t $(image) . ;

run:
	@cd $(proj_dir) && docker run --rm -it -p 127.0.0.1:8080:80 $(image);
