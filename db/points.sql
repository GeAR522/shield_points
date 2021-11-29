CREATE TABLE "points" (
    "id"            INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "user"          varchar,
    "github_url"    varchar,
    "questions"     varchar,
    "point_total"   integer,
    "create_at"     datetime NOT NULL);


