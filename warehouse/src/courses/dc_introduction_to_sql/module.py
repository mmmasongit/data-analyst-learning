from pathlib import Path

import pandas as pd

from ...logger import PipelineLogger
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
LOGGER = PipelineLogger(COURSE)


def bronze() -> None:
    LOGGER.bronze()

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
    LOGGER.silver()


def gold() -> None:
    LOGGER.gold()


def clean() -> None:
    LOGGER.clean()
    DATAFRAMES.clear()


def write() -> None:
    LOGGER.write()


def run_etl() -> None:
    try:
        bronze()
        silver()
        gold()
        write()
    finally:
        clean()
