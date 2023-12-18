"""Servant implementation for the delayed response mechanism."""

import Ice

import IceDrive


class DirectoryQueryResponse(IceDrive.DirectoryQueryResponse):
    """Query response receiver."""
    def rootDirectoryResponse(self, root: IceDrive.DirectoryPrx, current: Ice.Current = None) -> None:
        """Receive a Directory when other service instance knows the user."""


class DirectoryQuery(IceDrive.DirectoryQuery):
    """Query receiver."""
    def rootDirectory(self, user: IceDrive.UserPrx, response: IceDrive.DirectoryQueryResponsePrx, current: Ice.Current = None) -> None:
        """Receive a query about the user's root directory."""
