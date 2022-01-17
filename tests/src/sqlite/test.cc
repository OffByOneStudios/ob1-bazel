#include "sqlite3.h"
#include <string.h>
#include <iostream>
//#include "spdlog/spdlog.h"


int main(int argc, char** argv)
{	
    sqlite3* db;
    int rc = sqlite3_open("sqlite3_test.db", &db);
    if(rc != SQLITE_OK) {
        std::cout << sqlite3_errmsg(db) << "\n";
        return -1;
    }

    const char* create = R"SQL(
CREATE TABLE IF NOT EXISTS todos    
    (
        body TEXT,
        archived INT DEFAULT 0
    );
    INSERT INTO TODOS(body) VALUES 
        ('Hello'),
        ('WOrld')
    ;
)SQL";

    sqlite3_stmt* create_s;
    char* create_pzTail;

    if(SQLITE_OK != sqlite3_exec(db, create, nullptr, nullptr, &create_pzTail))
    {

        std::cout << "Prepare Error: " << sqlite3_errmsg(db) << "\n";
        sqlite3_free(create_pzTail);
        //spdlog::error("Error Preparing Statementg: {}", sqlite3_errmsg(db));

        return -1;
    }



    sqlite3_close(db);
    return 0;
}