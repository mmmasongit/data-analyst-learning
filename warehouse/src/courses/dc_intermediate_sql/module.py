from pathlib import Path

import pandas as pd

from ...logger import PipelineLogger
from ...schemas import DCIntermediateSql_CSVFile, IngestionOptions

COURSE = "dc_intermediate_sql"
COURSE_DATASET_DIRECTORY = (
    Path(__file__).resolve().parents[4]
    / "courses"
    / COURSE
    / "datasets"
    / "csv"
)
DATAFRAMES: dict[DCIntermediateSql_CSVFile, pd.DataFrame] = {}
LOGGER = PipelineLogger(COURSE)


def bronze() -> None:
    LOGGER.bronze()

    ingestion: dict[DCIntermediateSql_CSVFile, IngestionOptions] = {
        "films": {"header": None},
        "people": {"header": None},
        "reviews": {"header": None},
        "roles": {"header": None},
    }

    for file, options in ingestion.items():
        dataframe = pd.read_csv(
            COURSE_DATASET_DIRECTORY / (file + ".csv"),
            header=options["header"],
        )
        assert isinstance(dataframe, pd.DataFrame)
        DATAFRAMES[file] = dataframe


def silver_films() -> None:
    # Step 1: Create header columns
    DATAFRAMES["films"].columns = [
        "id",
        "title",
        "release_year",
        "country",
        "duration",
        "language",
        "certification",
        "gross",
        "budget",
    ]

    # Step 2: Change dtype from float64 to int64
    DATAFRAMES["films"]["release_year"] = DATAFRAMES["films"][
        "release_year"
    ].astype("Int64")

    # Step 3: Change dtype from float64 to int64
    DATAFRAMES["films"]["duration"] = DATAFRAMES["films"]["duration"].astype(
        "Int64"
    )


def silver_people() -> None:
    # Step 1: Create header columns
    DATAFRAMES["people"].columns = ["id", "name", "birthdate", "deathdate"]


def silver_reviews() -> None:
    # Step 1: Reload raw data and generate id column so the cell is safe to re-run
    DATAFRAMES["reviews"].insert(
        0, "id", range(1, len(DATAFRAMES["reviews"]) + 1)
    )

    # Step 2: Create header columns
    DATAFRAMES["reviews"].columns = [
        "id",
        "film_id",
        "num_user",
        "num_critic",
        "imdb_score",
        "num_votes",
        "facebook_likes",
    ]

    # Step 3: Change `num_user` dtype from float64 to int64
    DATAFRAMES["reviews"]["num_user"] = DATAFRAMES["reviews"][
        "num_user"
    ].astype("Int64")

    # Step 4: Change `num_critic` dtype from float64 to int64
    DATAFRAMES["reviews"]["num_critic"] = DATAFRAMES["reviews"][
        "num_critic"
    ].astype("Int64")

    # Step 5: Round `imdb_score` to 2 decimal places
    DATAFRAMES["reviews"]["imdb_score"] = DATAFRAMES["reviews"][
        "imdb_score"
    ].round(decimals=2)


def silver_roles() -> None:
    # Step 1: Create header columns
    DATAFRAMES["roles"].columns = [
        "id",
        "film_id",
        "person_id",
        "role",
    ]


def silver() -> None:
    LOGGER.silver()

    silver_films()
    silver_people()
    silver_reviews()
    silver_roles()


def gold() -> None:
    LOGGER.gold()

    # Example of gold layer -> aggregation into business reports
    # films_with_reviews: one row per review, enriched with its film's details
    # films_with_reviews = DATAFRAMES["reviews"].merge(
    #     DATAFRAMES["films"],
    #     left_on="film_id",
    #     right_on="id",
    #     suffixes=("_review", "_film"),
    # )


def clean() -> None:
    LOGGER.clean()
    DATAFRAMES.clear()


def write() -> None:
    LOGGER.write()
    LOGGER.info(DATAFRAMES["films"].head(1))
    LOGGER.info(DATAFRAMES["people"].head(1))
    LOGGER.info(DATAFRAMES["reviews"].head(1))
    LOGGER.info(DATAFRAMES["roles"].head(1))


def run_etl() -> None:
    try:
        bronze()
        silver()
        gold()
        write()
    finally:
        clean()
