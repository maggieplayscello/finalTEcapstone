-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;

CREATE TABLE app_user (
  id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32),
  salt varchar(255) NOT NULL
);

CREATE TABLE "courses"
(
 "course_id" int NOT NULL GENERATED ALWAYS AS IDENTITY (
 start 1
 ),
 "name"      varchar(50) NOT NULL,
 "rating"    float NOT NULL,
 "slope"     int NOT NULL,
 "par"       int NOT NULL,
 "city"      varchar(50) NOT NULL,
 "state"     varchar(2) NOT NULL,
 CONSTRAINT "PK_golf_courses" PRIMARY KEY ( "course_id" )
);

CREATE TABLE "golfer"
(
 "golfer_id" int NOT NULL GENERATED ALWAYS AS IDENTITY (
 start 1
 ),
 "id"        int NOT NULL,
 "street"    varchar(50) NOT NULL,
 "city"      varchar(50) NOT NULL,
 "state"     varchar(2) NOT NULL,
 "zip"       varchar(10) NOT NULL,
 CONSTRAINT "PK_golfer" PRIMARY KEY ( "golfer_id" ),
 CONSTRAINT "FK_88" FOREIGN KEY ( "id" ) REFERENCES "app_user" ( "id" )
);

CREATE INDEX "fkIdx_88" ON "golfer"
(
 "id"
);

CREATE TABLE "golfer_scores"
(
 "score_id"  int NOT NULL GENERATED ALWAYS AS IDENTITY (
 start 1
 ),
 "course_id" int NOT NULL,
 "score"     int NOT NULL,
 "golfer_id" int NOT NULL,
 CONSTRAINT "PK_user_scores" PRIMARY KEY ( "score_id" ),
 CONSTRAINT "FK_40" FOREIGN KEY ( "course_id" ) REFERENCES "courses" ( "course_id" ),
 CONSTRAINT "FK_98" FOREIGN KEY ( "golfer_id" ) REFERENCES "golfer" ( "golfer_id" )
);

CREATE INDEX "fkIdx_40" ON "golfer_scores"
(
 "course_id"
);

CREATE INDEX "fkIdx_98" ON "golfer_scores"
(
 "golfer_id"
);

CREATE TABLE "leagues"
(
 "league_id"    int NOT NULL GENERATED ALWAYS AS IDENTITY (
 start 1
 ),
 "course_id"    int NOT NULL,
 "league_name"  varchar(32) NOT NULL,
 "league_owner" varchar(32) NOT NULL,
 CONSTRAINT "PK_leagues" PRIMARY KEY ( "league_id" ),
 CONSTRAINT "FK_49" FOREIGN KEY ( "course_id" ) REFERENCES "courses" ( "course_id" )
);

CREATE INDEX "fkIdx_49" ON "leagues"
(
 "course_id"
);

CREATE TABLE "league_players"
(
 "league_player_id" int NOT NULL GENERATED ALWAYS AS IDENTITY (
 start 1
 ),
 "league_id"        int NOT NULL,
 "golfer_id"        int NOT NULL,
 CONSTRAINT "PK_league_players" PRIMARY KEY ( "league_player_id" ),
 CONSTRAINT "FK_55" FOREIGN KEY ( "league_id" ) REFERENCES "leagues" ( "league_id" ),
 CONSTRAINT "FK_91" FOREIGN KEY ( "golfer_id" ) REFERENCES "golfer" ( "golfer_id" )
);

CREATE INDEX "fkIdx_55" ON "league_players"
(
 "league_id"
);

CREATE INDEX "fkIdx_91" ON "league_players"
(
 "golfer_id"
);

CREATE TABLE "tee_times"
(
 "tee_time_id"             int NOT NULL GENERATED ALWAYS AS IDENTITY (
 start 1
 ),
 "course_id"               int NOT NULL,
 "day"                     date NOT NULL,
 "time"                    timestamp NOT NULL,
 "isAvalable"              boolean NOT NULL,
 "weather_recommendations" varchar(255) NOT NULL,
 CONSTRAINT "PK_tee_times" PRIMARY KEY ( "tee_time_id" ),
 CONSTRAINT "FK_30" FOREIGN KEY ( "course_id" ) REFERENCES "courses" ( "course_id" )
);

CREATE INDEX "fkIdx_30" ON "tee_times"
(
 "course_id"
);


CREATE TABLE "reservation"
(
 "reservation_id"    int NOT NULL GENERATED ALWAYS AS IDENTITY (
 start 1
 ),
 "id"                int NOT NULL,
 "tee_time_id"       int NOT NULL,
 "create_date"       date NOT NULL,
 "amount_of_golfers" int NOT NULL,
 CONSTRAINT "PK_reservation" PRIMARY KEY ( "reservation_id" ),
 CONSTRAINT "FK_69" FOREIGN KEY ( "tee_time_id" ) REFERENCES "tee_times" ( "tee_time_id" ),
 CONSTRAINT "FK_72" FOREIGN KEY ( "id" ) REFERENCES "app_user" ( "id" )
);

CREATE INDEX "fkIdx_69" ON "reservation"
(
 "tee_time_id"
);

CREATE INDEX "fkIdx_72" ON "reservation"
(
 "id"
);

COMMIT;