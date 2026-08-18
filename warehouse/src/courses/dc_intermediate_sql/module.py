from pathlib import Path

import pandas as pd
from sqlalchemy import Engine

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


def bronze(engine: Engine) -> None:
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

        dataframe.to_sql(
            con=engine,
            if_exists="replace",
            index=False,
            name=file,
            schema="bronze",
        )


def silver_films(engine: Engine) -> None:
    df = DATAFRAMES["films"]

    # Step 1: Create header columns
    df.columns = [
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
    df["release_year"] = df["release_year"].astype("Int64")

    # Step 3: Change dtype from float64 to int64
    df["duration"] = df["duration"].astype("Int64")

    # Step 4: Write to database
    df.to_sql(
        con=engine,
        if_exists="replace",
        index=False,
        name="films",
        schema="silver",
    )


def silver_people(engine: Engine) -> None:
    df = DATAFRAMES["people"]

    # Step 1: Create header columns
    df.columns = ["id", "name", "birthdate", "deathdate"]

    # Step 2: Write to database
    df.to_sql(
        con=engine,
        if_exists="replace",
        index=False,
        name="people",
        schema="silver",
    )


def silver_reviews(engine: Engine) -> None:
    df = DATAFRAMES["reviews"]

    # Step 1: Reload raw data and generate id column so the cell is safe to re-run
    df.insert(0, "id", range(1, len(df) + 1))

    # Step 2: Create header columns
    df.columns = [
        "id",
        "film_id",
        "num_user",
        "num_critic",
        "imdb_score",
        "num_votes",
        "facebook_likes",
    ]

    # Step 3: Change `num_user` dtype from float64 to int64
    df["num_user"] = df["num_user"].astype("Int64")

    # Step 4: Change `num_critic` dtype from float64 to int64
    df["num_critic"] = df["num_critic"].astype("Int64")

    # Step 5: Round `imdb_score` to 2 decimal places
    df["imdb_score"] = df["imdb_score"].round(decimals=2)

    # Step 6: Write to database
    df.to_sql(
        con=engine,
        if_exists="replace",
        index=False,
        name="reviews",
        schema="silver",
    )


def silver_roles(engine: Engine) -> None:
    df = DATAFRAMES["roles"]

    # Step 1: Create header columns
    df.columns = [
        "id",
        "film_id",
        "person_id",
        "role",
    ]

    # Step 2: Write to database
    df.to_sql(
        con=engine,
        if_exists="replace",
        index=False,
        name="roles",
        schema="silver",
    )


def silver(engine: Engine) -> None:
    silver_films(engine)
    silver_people(engine)
    silver_reviews(engine)
    silver_roles(engine)


def gold(engine: Engine) -> None:
    pass


def clean() -> None:
    DATAFRAMES.clear()


def run_etl(engine: Engine) -> None:
    try:
        bronze(engine)
        silver(engine)
        gold(engine)
    finally:
        clean()
