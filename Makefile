.PHONY: test

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt;
lint:
	flake8 hello_world_test;
test:
	PYTHONPATH=. py.test  --verbose -s;
docker-build:
	docker build -t hello-world-printer .;
docker_run: docker_build
	docker_run \
		--name hello_world_printer-devv \
		-p 5000:5000 \
		-d hello_world_printer
