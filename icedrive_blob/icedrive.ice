// -*- mode: c++ -*-
[["ice-prefix"]] module IceDrive {

  // Basic types
  sequence<byte> Bytes;
  sequence<string> Strings;

  // Exceptions
  exception Unauthorized { string username; };
  exception UserAlreadyExists { string username; };
  exception UserNotExist { string username; };

  exception ChildAlreadyExists { string childName; string path; };
  exception ChildNotExists { string childName; string path; };
  exception RootHasNoParent {};
  exception FileNotFound { string filename; };
  exception FileAlreadyExists { string filename; };

  exception UnknownBlob { string blobId; };
  exception FailedToReadData {};

  exception TemporaryUnavailable { string serviceName; };

  // *** SERVICES *** //

  // Authentication Service
  interface User {
    string getUsername();
    bool isAlive();
    void refresh() throws Unauthorized, UserNotExist;
  };

  interface Authentication {
    User* login(string username, string password) throws Unauthorized;
    User* newUser(string username, string password) throws UserAlreadyExists;
    void removeUser(string username, string password) throws Unauthorized; // Hide UserNotExist to avoid showing too much info
    bool verifyUser(User *user); // checks if the proxy is created by a valid instance of Authentication, not if the credentials are still valid.
  };

  // Authentication queries
  interface AuthenticationQueryResponse {
    void loginResponse(User* user);
    void userExists();
    void userRemoved();
    void verifyUserResponse(bool result);
  };

  interface AuthenticationQuery {
    void login(string username, string password, AuthenticationQueryResponse* response);
    void doesUserExist(string username, AuthenticationQueryResponse* response);
    void removeUser(string username, string password, AuthenticationQueryResponse* response);
    void verifyUser(User *user, AuthenticationQueryResponse* response);
  };

  // Blob Storage Service
  interface DataTransfer {
    Bytes read(int size) throws FailedToReadData;
    void close();
  };

  interface BlobService {
    void link(string blobId) throws UnknownBlob;
    void unlink(string blobId) throws UnknownBlob;

    string upload(User* user, DataTransfer *blob) throws FailedToReadData, TemporaryUnavailable;
    DataTransfer* download(User* user, string blobId) throws UnknownBlob, TemporaryUnavailable;
  };

  // Blob service queries
  interface BlobQueryResponse {
    void downloadBlob(DataTransfer* blob);
    void blobExists();
    void blobLinked();
    void blobUnlinked();
  };

  interface BlobQuery {
    void downloadBlob(string blobId, BlobQueryResponse* response);
    void blobIdExists(string blobId, BlobQueryResponse* response);
    void linkBlob(string blobId, BlobQueryResponse* response);
    void unlinkBlob(string blobId, BlobQueryResponse* response);
  };

  // Directory Service

  interface Directory {
    string getPath();
    Directory* getParent() throws RootHasNoParent;
    Strings getChilds();
    Directory* getChild(string childName) throws ChildNotExists;
    Directory* createChild(string childName) throws ChildAlreadyExists;
    void removeChild(string childName) throws ChildNotExists;

    Strings getFiles();
    string getBlobId(string filename) throws FileNotFound;
    void linkFile(string fileName, string blobId) throws FileAlreadyExists, TemporaryUnavailable;
    void unlinkFile(string fileName) throws FileNotFound, TemporaryUnavailable;
  };

  interface DirectoryService {
    Directory* getRoot(User* user) throws TemporaryUnavailable;
  };

  // Directory service queries
  interface DirectoryQueryResponse{
    void rootDirectoryResponse(Directory *root);
  };

  interface DirectoryQuery{
    void rootDirectory(User* user, DirectoryQueryResponse* response);
  };

  // *** Services discovery *** //
  interface Discovery {
    void announceAuthentication(Authentication* prx);
    void announceDirectoryServicey(DirectoryService* prx);
    void announceBlobService(BlobService* prx);
  };
}
