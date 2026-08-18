from collections.abc import Sequence
from typing import Literal, TypedDict

import pandas as pd

DCIntermediateSql_CSVFile = Literal["films", "people", "reviews", "roles"]
DCIntroductionToSql_CSVFile = Literal["books"]
DCJoiningDataInSql_CSVFile = Literal[
    "countries/cities",
    "countries/countries",
    "countries/currencies",
    "countries/economies",
    "countries/economies2015",
    "countries/economies2019",
    "countries/eu_countries",
    "countries/languages",
    "countries/populations",
    "leaders/monarchs",
    "leaders/presidents",
    "leaders/prime_minister_terms",
    "leaders/prime_ministers",
    "leaders/states",
]
UdemyTheCompleteSqlBootcamp30HoursGoFromZeroToHero_CSVFile = Literal[
    "Customers", "Employees", "Orders", "OrdersArchive", "Products"
]
LogMessage = str | pd.DataFrame


class IngestionOptions(TypedDict):
    header: int | Sequence[int] | None
