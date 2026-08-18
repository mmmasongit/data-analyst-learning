from pathlib import Path

import pandas as pd
from sqlalchemy import Engine

from ...schemas import DCJoiningDataInSql_CSVFile, IngestionOptions

COURSE = "dc_joining_data_in_sql"
COURSE_DATASET_DIRECTORY = (
    Path(__file__).resolve().parents[4]
    / "courses"
    / COURSE
    / "datasets"
    / "csv"
)
DATAFRAMES: dict[DCJoiningDataInSql_CSVFile, pd.DataFrame] = {}


def bronze() -> None:
    ingestion: dict[DCJoiningDataInSql_CSVFile, IngestionOptions] = {
        "countries/cities": {"header": None},
        "countries/countries": {"header": None},
        "countries/currencies": {"header": None},
        "countries/economies": {"header": None},
        "countries/economies2015": {"header": None},
        "countries/economies2019": {"header": None},
        "countries/eu_countries": {"header": None},
        "countries/languages": {"header": None},
        "countries/populations": {"header": None},
        "leaders/monarchs": {"header": None},
        "leaders/presidents": {"header": None},
        "leaders/prime_minister_terms": {"header": None},
        "leaders/prime_ministers": {"header": None},
        "leaders/states": {"header": None},
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
