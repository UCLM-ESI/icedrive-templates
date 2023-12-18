"""Module for servants implementations."""

from typing import List

import Ice

import IceDrive


class Directory(IceDrive.Directory):
    """Implementation of the IceDrive.Directory interface."""

    def getPath(self, current: Ice.Current = None) -> str:
        """Return the path for the directory within the user space."""

    def getParent(self, current: Ice.Current = None) -> IceDrive.DirectoryPrx:
        """Return the proxy to the parent directory, if it exists. None in other case."""

    def getChilds(self, current: Ice.Current = None) -> List[str]:
        """Return a list of names of the directories contained in the directory."""

    def getChild(self, name: str, current: Ice.Current = None) -> IceDrive.DirectoryPrx:
        """Return the proxy to one specific directory inside the current one."""

    def createChild(
        self, name: str, current: Ice.Current = None
    ) -> IceDrive.DirectoryPrx:
        """Create a new child directory and returns its proxy."""

    def removeChild(self, name: str, current: Ice.Current = None) -> None:
        """Remove the child directory with the given name if exists."""

    def getFiles(self, current: Ice.Current = None) -> List[str]:
        """Return a list of the files linked inside the current directory."""

    def getBlobId(self, filename: str, current: Ice.Current = None) -> str:
        """Return the "blob id" for a given file name inside the directory."""

    def linkFile(
        self, filename: str, blob_id: str, current: Ice.Current = None
    ) -> None:
        """Link a file to a given blob_id."""

    def unlinkFile(self, filename: str, current: Ice.Current = None) -> None:
        """Unlink (remove) a filename from the current directory."""


class DirectoryService(IceDrive.DirectoryService):
    """Implementation of the IceDrive.Directory interface."""

    def getRoot(self, user: IceDrive.UserPrx, current: Ice.Current = None) -> IceDrive.DirectoryPrx:
        """Return the proxy for the root directory of the given user."""
