from pathlib import Path

import pandas as pd

from ...logger import PipelineLogger
from ...schemas import (
    IngestionOptions,
    UdemyTheCompleteSqlBootcamp30HoursGoFromZeroToHero_CSVFile,
)

COURSE = "udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero"
COURSE_DATASET_DIRECTORY = (
    Path(__file__).resolve().parents[4]
    / "courses"
    / COURSE
    / "datasets"
    / "csv"
)
DATAFRAMES: dict[
    UdemyTheCompleteSqlBootcamp30HoursGoFromZeroToHero_CSVFile, pd.DataFrame
] = {}
LOGGER = PipelineLogger(COURSE)


def bronze() -> None:
    LOGGER.bronze()

    ingestion: dict[
        UdemyTheCompleteSqlBootcamp30HoursGoFromZeroToHero_CSVFile,
        IngestionOptions,
    ] = {
        "Customers": {"header": None},
        "Employees": {"header": None},
        "Orders": {"header": None},
        "OrdersArchive": {"header": None},
        "Products": {"header": None},
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
