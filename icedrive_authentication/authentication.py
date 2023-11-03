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


class Authentication(IceDrive.Authentication):
    """Implementation of an IceDrive.Authentication interface."""

    def login(
        self, username: str, password: str, current: Ice.Current = None
    ) -> IceDrive.UserPrx:
        """Authenticate an user by username and password and return its User."""

    def newUser(
        self, username: str, password: str, current: Ice.Current = None
    ) -> IceDrive.UserPrx:
        """Create an user with username and the given password."""

    def removeUser(
        self, username: str, password: str, current: Ice.Current = None
    ) -> None:
        """Remove the user "username" if the "password" is correct."""

    def verifyUser(self, user: IceDrive.UserPrx, current: Ice.Current = None) -> bool:
        """Check if the user belongs to this service.

        Don't check anything related to its authentication state or anything else.
        """
