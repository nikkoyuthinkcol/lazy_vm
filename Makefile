SHELL=/bin/bash
.PHONY : all docker docker_compose nvidia_container_runtime kubernetes terraform

all: post_install_cpu

gpu: post_install_gpu

azurecli:
	./install_azurecli.sh

driver:
	./install_drivers.sh

docker:
	./install_docker.sh

docker_compose: docker
	./install_docker_compose.sh

kubernetes: docker
	./install_k8.sh

terraform:
	./install_terraform.sh

nvidia_container_runtime: docker_compose driver
	./install_nvidia_container_toolkit.sh

terminal:
	./install_terminal.sh

restic:
	sudo apt-get install restic

post_install_gpu: nvidia_container_runtime kubernetes terraform restic terminal
	newgrp docker

post_install_cpu: kubernetes terraform restic terminal
	newgrp docker