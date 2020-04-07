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
 "course_id" SERIAL NOT NULL PRIMARY KEY,
 "name"      varchar(50) NOT NULL,
 "rating"    float NOT NULL,
 "slope"     int NOT NULL,
 "par"       int NOT NULL,
 "city"      varchar(50) NOT NULL,
 "state"     varchar(2) NOT NULL
);

CREATE TABLE "golfer"
(
 "golfer_id" SERIAL NOT NULL PRIMARY KEY,
 "id"        int NOT NULL,
 "street"    varchar(50) NOT NULL,
 "city"      varchar(50) NOT NULL,
 "state"     varchar(2) NOT NULL,
 "zip"       varchar(10) NOT NULL,
 CONSTRAINT "fk_user" FOREIGN KEY ( "id" ) REFERENCES "app_user" ( "id" )
);

CREATE TABLE "golfer_scores"
(
 "score_id"  SERIAL NOT NULL PRIMARY KEY,
 "course_id" int NOT NULL,
 "score"     int NOT NULL,
 "golfer_id" int NOT NULL,
 CONSTRAINT "fk_course_id" FOREIGN KEY ( "course_id" ) REFERENCES "courses" ( "course_id" ),
 CONSTRAINT "fk_golfer_id" FOREIGN KEY ( "golfer_id" ) REFERENCES "golfer" ( "golfer_id" )
);

CREATE TABLE "leagues"
(
 "league_id"    SERIAL NOT NULL PRIMARY KEY,
 "course_id"    int NOT NULL,
 "league_name"  varchar(32) NOT NULL,
 "league_owner" varchar(32) NOT NULL,
 CONSTRAINT "fk_course_id" FOREIGN KEY ( "course_id" ) REFERENCES "courses" ( "course_id" )
);

CREATE TABLE "league_players"
(
 "league_player_id" SERIAL NOT NULL PRIMARY KEY,
 "league_id"        int NOT NULL,
 "golfer_id"        int NOT NULL,
 CONSTRAINT "fk_league_id" FOREIGN KEY ( "league_id" ) REFERENCES "leagues" ( "league_id" ),
 CONSTRAINT "fk_golfer_id" FOREIGN KEY ( "golfer_id" ) REFERENCES "golfer" ( "golfer_id" )
);

CREATE TABLE "tee_times"
(
 "tee_time_id"             SERIAL NOT NULL PRIMARY KEY,
 "course_id"               int NOT NULL,
 "day"                     date NOT NULL,
 "time"                    timestamp NOT NULL,
 "isAvalable"              boolean NOT NULL,
 "weather_recommendations" varchar(255) NOT NULL,
 CONSTRAINT "fk_course_id" FOREIGN KEY ( "course_id" ) REFERENCES "courses" ( "course_id" )
);

CREATE TABLE "reservation"
(
 "reservation_id"    SERIAL NOT NULL PRIMARY KEY,
 "id"                int NOT NULL,
 "tee_time_id"       int NOT NULL,
 "create_date"       date NOT NULL,
 "amount_of_golfers" int NOT NULL,
 CONSTRAINT "fk_tee_time_id" FOREIGN KEY ( "tee_time_id" ) REFERENCES "tee_times" ( "tee_time_id" ),
 CONSTRAINT "fk_id" FOREIGN KEY ( "id" ) REFERENCES "app_user" ( "id" )
);

COMMIT;