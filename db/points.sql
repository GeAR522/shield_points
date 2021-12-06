CREATE TABLE "points" (
    "id"            INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "user"          varchar,
    "github_url"    varchar,
    "point_total"   INTEGER,
    "create_at"     datetime NOT NULL);
