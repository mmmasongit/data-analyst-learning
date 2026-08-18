import logging

import pandas as pd

from .schemas import LogMessage

logging.basicConfig(
    level=logging.INFO,
    format="%(message)s",
)

logger = logging.getLogger("warehouse")


class PipelineLogger:
    def __init__(self, symbol: str, enabled: bool = False) -> None:
        self.symbol = symbol.upper()
        self.enabled = enabled

    def _log(
        self,
        stage: str,
        message: LogMessage | None = None,
    ) -> None:
        if not self.enabled:
            return

        prefix = f">>> EXECUTING {self.symbol} {stage} LAYER"

        if message is None:
            logger.info("%s", prefix)
        elif isinstance(message, pd.DataFrame):
            logger.info("%s\n%s", prefix, message)
        else:
            logger.info("%s: %s", prefix, message)

    def info(
        self,
        message: LogMessage,
        newline: bool = False,
    ) -> None:
        if not self.enabled:
            return

        if isinstance(message, pd.DataFrame):
            logger.info(">>>\n%s", message)
            return

        suffix = "\n" if newline else ""
        logger.info(">>> %s%s", message, suffix)

    def bronze(self, message: LogMessage | None = None) -> None:
        self._log("BRONZE", message)

    def silver(self, message: LogMessage | None = None) -> None:
        self._log("SILVER", message)

    def gold(self, message: LogMessage | None = None) -> None:
        self._log("GOLD", message)

    def clean(self, message: LogMessage | None = None) -> None:
        self._log("CLEANING", message)

    def write(self, message: LogMessage | None = None) -> None:
        self._log("WRITING", message)
