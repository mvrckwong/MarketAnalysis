project_init:
	poetry install

project_reqs:
	poetry export -f requirements.txt --output requirements.txt --without-hashes