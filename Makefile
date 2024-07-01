run_ingestion:
	poetry run python src/ingestion.py

project_reqs:
	poetry export -f requirements.txt --output requirements.txt --without-hashes