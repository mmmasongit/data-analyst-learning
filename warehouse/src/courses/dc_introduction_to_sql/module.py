from pathlib import Path

import pandas as pd
from sqlalchemy import Engine

from ...schemas import DCIntroductionToSql_CSVFile, IngestionOptions

COURSE = "dc_introduction_to_sql"
COURSE_DATASET_DIRECTORY = (
    Path(__file__).resolve().parents[4]
    / "courses"
    / COURSE
    / "datasets"
    / "csv"
)
DATAFRAMES: dict[DCIntroductionToSql_CSVFile, pd.DataFrame] = {}


def bronze() -> None:
    ingestion: dict[DCIntroductionToSql_CSVFile, IngestionOptions] = {
        "books": {"header": None}
    }

    for file, options in ingestion.items():
        dataframe = pd.read_csv(
            COURSE_DATASET_DIRECTORY / (file + ".csv"),
            header=options["header"],
        )
        assert isinstance(dataframe, pd.DataFrame)
        DATAFRAMES[file] = dataframe


def silver() -> None:
    pass


def gold() -> None:
    pass


def clean() -> None:
    DATAFRAMES.clear()


def write(engine: Engine) -> None:
    pass


def run_etl(engine: Engine) -> None:
    try:
        bronze()
        silver()
        gold()
        write(engine)
    finally:
        clean()
