// -*- mode: c++ -*-
[["ice-prefix"]] module IceDrive {

  // Basic types
  sequence<byte> Bytes;
  sequence<string> Strings;

  // Exceptions
  exception Unauthorized { string username; };
  exception UserAlreadyExists { string username; };
  exception UserNotExist { string username; };

  exception ChildAlreadyExists { string childName; string path; }
  exception ChildNotExists { string childName; string path; }
  exception RootHasNoParent {};
  exception FileNotFound { string filename; }
  exception FileAlreadyExists { string filename; }

  exception UnknownBlob { string blobId; };
  exception FailedToReadData {};

  // *** SERVICES *** //

  // Authentication Service
  interface User {
    string getUsername();
    bool isAlive();
    void refresh() throws Unauthorized, UserNotExist;
  }

  interface Authentication {
    User* login(string username, string password) throws Unauthorized;
    User* newUser(string username, string password) throws UserAlreadyExists;
    void removeUser(string username, string password) throws Unauthorized; // Hide UserNotExist to avoid showing too much info
    bool verifyUser(User *user); // checks if the proxy is created by a valid instance of Authentication, not if the credentials are still valid.
  };

  // Blob Storage Service

  interface DataTransfer {
    Bytes read(int size) throws FailedToReadData;
    void close();
  };

  interface BlobService {
    void link(string blobId) throws UnknownBlob;
    void unlink(string blobId) throws UnknownBlob;

    string upload(DataTransfer *blob) throws FailedToReadData;
    DataTransfer* download(string blobId) throws UnknownBlob;
  };

  // Directory Service

  interface Directory {
    Directory* getParent() throws RootHasNoParent;
    Strings getChilds();
    Directory* getChild(string childName) throws ChildNotExists;
    Directory* createChild(string childName) throws ChildAlreadyExists;
    void removeChild(string childName) throws ChildNotExists;

    Strings getFiles();
    string getBlobId(string filename) throws FileNotFound;
    void linkFile(string fileName, string blobId) throws FileAlreadyExists;
    void unlinkFile(string fileName) throws FileNotFound;
  };

  interface DirectoryService {
    Directory* getRoot(string user);
  };

}
