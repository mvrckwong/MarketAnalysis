from pathlib import Path
from sqlalchemy import types
from dataclasses import dataclass
from sqlalchemy import types


SRC_DIR = Path(__file__).parent
PRJ_DIR = SRC_DIR.parent
DATA_DIR = PRJ_DIR / "data"

# Setup the database datattypes
db_dtype_dict = {
    # date types 
    'date': types.Date,
    'birthdate': types.Date,
    'acct_open_date': types.Date,
    'return_date': types.Date,
    'first_opened_date': types.Date,
    'last_remodel_date': types.Date,
    'transaction_date': types.Date,
    'stock_date': types.Date,
}    

# Config the database constraints
db_constraints_dict = {
    "ColumnName1": {
        "primary_key": True,
        "nullable": False,
        "unique": False,
        "default": None,
        "foreign_key": None
    },
    "ColumnName2": {
        "primary_key": False,
        "nullable": False,
        "unique": True,
        "default": "default_value",
        "foreign_key": None
    },
}

# Running the main function
if __name__ == "__main__":
    None


"""
__all__ = [
    "TypeEngine",
    "TypeDecorator",
    "UserDefinedType",
    "ExternalType",
    "INT",
    "CHAR",
    "VARCHAR",
    "NCHAR",
    "NVARCHAR",
    "TEXT",
    "Text",
    "FLOAT",
    "NUMERIC",
    "REAL",
    "DECIMAL",
    "TIMESTAMP",
    "DATETIME",
    "CLOB",
    "BLOB",
    "BINARY",
    "VARBINARY",
    "BOOLEAN",
    "BIGINT",
    "SMALLINT",
    "INTEGER",
    "DATE",
    "TIME",
    
    "TupleType",
    "String",
    "Integer",
    "SmallInteger",
    "BigInteger",
    "Numeric",
    "Float",
    "DateTime",
    "Date",
    "Time",
    "LargeBinary",
    "Boolean",
    "Unicode",
    "Concatenable",
    "UnicodeText",
    "PickleType",
    "Interval",
    "Enum",
    "Indexable",
    "ARRAY",
    "JSON",
]

"""