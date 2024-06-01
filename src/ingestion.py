from config import DATA_DIR, PRJ_DIR, SRC_DIR
from dotenv import load_dotenv

from os import getenv
from pathlib import Path

import pandas as pd
from sqlalchemy import create_engine


def load_csv_to_db(csv_file: str, engine: create_engine):
    # Extract table name from the CSV file name
    table_name = csv_file.stem.capitalize()
    df = pd.read_csv(csv_file)
    
    # Load DataFrame into the database
    df.to_sql(table_name, engine, if_exists='replace', index=False)

def main(csv_dir=Path | str):
    # Preprocess the args
    if isinstance(csv_dir, str):
        csv_dir = Path(csv_dir)
    
    # Specify the dotenv path
    env_file = SRC_DIR / ".env"
    if not env_file.exists():
        raise FileNotFoundError("Environment file not found!")
    
    # Load environment variables from .env file
    load_dotenv(env_file)
    
    # Database Credentials
    db_host = getenv('DB_HOST')
    db_user = getenv('DB_USER')
    db_pw = getenv('DB_PW')
    db_name = getenv('DB_NAME')

    # Print environment variables to debug
    if not all([db_host, db_user, db_pw, db_name]):
        raise ValueError("One or more environment variables are not set!")
    
    # Database connection details
    db_uri = f'postgresql://{db_user}:{db_pw}@{db_host}/{db_name}?sslmode=require'
    db_engine = create_engine(db_uri)
    
    # Iterate through all CSV files in the directory and load them into the database
    for csv_file in csv_dir.glob('*.csv'):
        try:
            load_csv_to_db(csv_file, db_engine)
        except Exception as e:
            print(f"Error uploading {csv_file}: {e}")
    return True


# Running the main function
if __name__ == "__main__":
    if main(DATA_DIR):
        print("Main function finished successfully.")