import os
from collections.abc import Callable
from pathlib import Path

from dotenv import load_dotenv
from sqlalchemy import URL, Engine, create_engine, text

from . import (
    dc_intermediate_sql_run_etl,
    dc_introduction_to_sql_run_etl,
    dc_joining_data_in_sql_run_etl,
    udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero_run_etl,
)

DATABASE_SQL_DIRECTORY = Path(__file__).resolve().parents[1] / "sql"


def create_database_url(database: str) -> URL:
    sql_driver = os.getenv(
        "SQL_DRIVER",
        "ODBC Driver 18 for SQL Server",
    )
    sql_server = os.getenv(
        "SQL_SERVER",
        r"ZETALAPTOP\SQLEXPRESS",
    )

    return URL.create(
        "mssql+pyodbc",
        database=database,
        host=sql_server,
        query={
            "driver": sql_driver,
            "Encrypt": "yes",
            "trusted_connection": "yes",
            "TrustServerCertificate": "yes",
        },
    )


def create_database_engine(database: str, echo: bool = False) -> Engine:
    return create_engine(
        create_database_url(database), echo=echo, isolation_level="AUTOCOMMIT"
    )


def init_medallion_database(engine: Engine) -> None:
    sql_file = DATABASE_SQL_DIRECTORY / "01_create_warehouse_database.sql"
    sql_script = sql_file.read_text(encoding="utf-8")

    with engine.connect() as connection:
        connection.execute(text(sql_script))


def init_medallion_schemas(engine: Engine) -> None:
    sql_files = [
        DATABASE_SQL_DIRECTORY / "02_drop_tables_on_warehouse.sql",
        DATABASE_SQL_DIRECTORY / "03_drop_schemas_on_warehouse.sql",
        DATABASE_SQL_DIRECTORY / "04_create_required_schemas_on_warehouse.sql",
    ]

    for sql_file in sql_files:
        sql_script = sql_file.read_text(encoding="utf-8")
        with engine.connect() as connection:
            connection.execute(text(sql_script))


def run_pipeline(run_etl: Callable[[Engine], None], engine: Engine) -> None:
    run_etl(engine)


def main() -> None:
    load_dotenv()
    master_engine = create_database_engine("master", echo=False)

    try:
        init_medallion_database(master_engine)
    except Exception:  # noqa: BLE001, S110
        pass
    finally:
        master_engine.dispose()

    warehouse_engine = create_database_engine("warehouse", echo=False)
    try:
        init_medallion_schemas(warehouse_engine)

        course_pipelines = [
            dc_intermediate_sql_run_etl,
            dc_introduction_to_sql_run_etl,
            dc_joining_data_in_sql_run_etl,
            udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero_run_etl,
        ]

        for run_etl in course_pipelines:
            run_pipeline(run_etl, warehouse_engine)
    except Exception:  # noqa: BLE001, S110
        pass
    finally:
        warehouse_engine.dispose()


if __name__ == "__main__":
    main()
