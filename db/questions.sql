CREATE TABLE "questions" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "point_id" INTEGER,
    "review_subtotal" INTEGER,
    "testing_subtotal" INTEGER,
    "housekeeping_subtotal" INTEGER,
    "productivity_subtotal" INTEGER,
    "meta_subtotal" INTEGER,
    "created_at" datetime NOT NULL);
