from pathlib import Path
from sqlalchemy import types
from dataclasses import dataclass
from sqlalchemy import types

from typing import Dict, List, get_type_hints

SRC_DIR = Path(__file__).parent
PRJ_DIR = SRC_DIR.parent
DATA_DIR = PRJ_DIR / "data"

@dataclass
class TableDTypes:
    ColumnName1: types.Integer
    ColumnName2: types.String
    
def get_dtype(dataclass_type = TableDTypes) -> Dict[str, types]:
    return {field: dtype for field, dtype in get_type_hints(dataclass_type).items()}

# Running the main function
if __name__ == "__main__":
    print(get_dtype())
