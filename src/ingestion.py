from dotenv import load_dotenv

from os import getenv
from pathlib import Path

import pandas as pd
from sqlalchemy import create_engine, types
from tqdm import tqdm
from typing import List, Dict

from config import DATA_DIR, PRJ_DIR, SRC_DIR, \
    db_dtype_dict, db_constraints_dict


def load_csv_to_db(csv_file: Path | List[Path], engine: create_engine, dtype: Dict[str, types] = None, schema: str = None):
    
    # Extract table name from the CSV file name
    table_name = csv_file.stem.lower()
    df = pd.read_csv(csv_file)
    
    # Load DataFrame into the database with specified datatypes and schema
    df.to_sql(
        table_name, 
        engine, 
        if_exists='replace', 
        index=False, 
        dtype=dtype,
        schema=schema
    )

def main(csv_dir=Path | str, schema: str = None):
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
    
    # Get datatypes
    db_dtypes = db_dtype_dict
    
    # Iterate through all the CSV files to the databases
    for csv_file in tqdm(csv_dir.glob('*.csv'), desc="Uploading CSV's", unit="file"):
        try:
            load_csv_to_db(csv_file, db_engine, db_dtypes, schema=schema)
        except Exception as e:
            print(f"Error in uploading {csv_file}: {e}")
            return False
    
    return True


# Running the main function
if __name__ == "__main__":
    schema_name = 'raw'  # Specify your schema name here
    if main(DATA_DIR, schema=schema_name):
        print("Main function finished successfully.")
