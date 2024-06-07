from config import DATA_DIR, PRJ_DIR, SRC_DIR, \
    db_dtype_dict, db_constraints_dict
from dotenv import load_dotenv

from os import getenv
from pathlib import Path

import pandas as pd
from sqlalchemy import create_engine, types
from tqdm import tqdm
from typing import List, Dict


def load_csv_to_db(csv_file: Path | List[Path], engine: create_engine, dtype: Dict[str, types] = None):
    # Extract table name from the CSV file name
    table_name = csv_file.stem.capitalize()
    df = pd.read_csv(csv_file)
    
    # Load DataFrame into the database with specified datatypes
    df.to_sql(table_name, engine, if_exists='replace', index=False, dtype=dtype)

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
    
    # Get datatypes
    db_dtypes = db_dtype_dict
    db_constraints = db_constraints_dict
    
    # Iterate through all the CSV files to the databases
    for csv_file in tqdm(csv_dir.glob('*.csv'), desc="Uploading CSVs", unit="file"):
        try:
            load_csv_to_db(csv_file, db_engine, db_dtypes)
        except Exception as e:
            print(f"Error in uploading {csv_file}: {e}")
    
    # CSV files (Fact and Dimension tables)
    # csv_dtables = [file for file in csv_dir if not '_' in file.name]
    # csv_ftables = [file for file in csv_dir if '_' in file.name]
    
    # # Iterate through all CSV dimension tables
    # for csv_file in csv_dtables:
    #     try:
    #         load_csv_to_db(csv_file, db_engine)
    #     except Exception as e:
    #         print(f"Error uploading {csv_file}: {e}")
            
    # Iterate through all CSV fact tables
    
    return True


# Running the main function
if __name__ == "__main__":
    if main(DATA_DIR):
        print("Main function finished successfully.")