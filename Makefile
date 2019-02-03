.PHONY: test

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt;
lint:
	flake8 hello_world_test;
test:
	PYTHONPATH=. py.test  --verbose -s;
