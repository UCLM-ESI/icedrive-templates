"""Package for IceDrive Authentication implementation."""

import importlib.util
import logging
import os

import Ice


logging.basicConfig(level=logging.DEBUG)

if importlib.util.find_spec("IceDrive") is None:
    slice_path = os.path.join(os.path.dirname(__file__), "icedrive.ice")

    if not os.path.exists(slice_path):
        raise ImportError("Cannot find icedrive.ice for loading IceDrive module")

    Ice.loadSlice(slice_path)
