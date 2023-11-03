"""Module for servants implementations."""

import Ice

import IceDrive


class User(IceDrive.User):
    """Implementation of an IceDrive.User interface."""

    def getUsername(self, current: Ice.Current = None) -> str:
        """Return the username for the User object."""

    def isAlive(self, current: Ice.Current = None) -> bool:
        """Check if the authentication is still valid or not."""

    def refresh(self, current: Ice.Current = None) -> None:
        """Renew the authentication for 1 more period of time."""


class BlobService(IceDrive.BlobService):
    """Implementation of an IceDrive.BlobService interface."""

    def link(self, blob_id: str, current: Ice.Current = None) -> None:
        """Mark a blob_id file as linked in some directory."""

    def unlink(self, blob_id: str, current: Ice.Current = None) -> None:
        """Mark a blob_id as unlinked (removed) from some directory."""

    def upload(
        self, blob: IceDrive.DataTransferPrx, current: Ice.Current = None
    ) -> str:
        """Register a DataTransfer object to upload a file to the service."""

    def download(
        self, blob_id: str, current: Ice.Current = None
    ) -> IceDrive.DataTransferPrx:
        """Return a DataTransfer objet to enable the client to download the given blob_id."""
