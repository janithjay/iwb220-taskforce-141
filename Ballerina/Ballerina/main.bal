import ballerina/io;
import ballerinax/mongodb;

public function main() {
    // Define connection details
    string host = "localhost";
    int port = 27017;
    string username = "udana";   // Replace with your MongoDB username
    string password = "udana1996";   // Replace with your MongoDB password
    string adminDatabase = "DemoDB";        // Replace with the authentication database, usually 'admin' for MongoDB

    // Initialize MongoDB client with connection details
    mongodb:Client mongoDb = checkpanic new ({
        connection: {
            serverAddress: {
                host: host,
                port: port
            },
            auth: <mongodb:ScramSha256AuthCredential>{
                username: username,
                password: password,
                database: adminDatabase
            }
        }
    });

    // Access the database you want to work with (replace with your actual database name)
    string targetDatabase = "DemoDB";  // Replace with your target database
    mongodb:Database db = checkpanic mongoDb->getDatabase(targetDatabase);

    // Example: print a message to indicate successful connection
    io:println("Successfully connected to the database: " + targetDatabase);

    // Example: Access a collection called 'Tickets' in the 'DemoDB' database
    mongodb:Collection ticketsCollection = checkpanic db->getCollection("Tickets");

    // Example: Perform operations on the collection (optional)
    // Here you could perform insert, find, delete, etc.

    // Close the MongoDB client
    checkpanic mongoDb->close();
}
