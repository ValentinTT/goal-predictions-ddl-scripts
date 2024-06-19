-- Contents of create_table_group.sql
CREATE TABLE GROUP (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    id_tournament INTEGER REFERENCES TOURNAMENT(id)
);

-- Contents of create_table_group_standings.sql
CREATE TABLE GROUP_STANDINGS (
    id_team INTEGER REFERENCES TEAM(id),
    id_group INTEGER REFERENCES GROUP(id),
    pos INTEGER,
    points INTEGER,
    PRIMARY KEY (id_team, id_group, pos)
);

-- Contents of create_table_match.sql
CREATE TABLE MATCH (
    id SERIAL PRIMARY KEY,
    id_home_team INTEGER REFERENCES TEAM(id),
    id_away_team INTEGER REFERENCES TEAM(id),
    start_date TIMESTAMP,
    score_home INTEGER,
    score_away INTEGER,
    id_venue INTEGER REFERENCES VENUE(id),
    id_match_type INTEGER REFERENCES MATCH_TYPE(id),
    id_group INTEGER REFERENCES GROUP(id),
    id_playoff_round INTEGER REFERENCES PLAYOFF_ROUND(id)
);

-- Contents of create_table_match_type.sql
CREATE TABLE MATCH_TYPE (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Contents of create_table_playoff_round.sql
CREATE TABLE PLAYOFF_ROUND (
    id SERIAL PRIMARY KEY,
    id_playoff_type INTEGER REFERENCES PLAYOFF_TYPE(id),
    id_tournament INTEGER REFERENCES TOURNAMENT(id)
);

-- Contents of create_table_playoff_type.sql
CREATE TABLE PLAYOFF_TYPE (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Contents of create_table_team.sql
CREATE TABLE TEAM (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    abbreviation VARCHAR(10),
    flag_name VARCHAR(255)
);

-- Contents of create_table_team_x_tournament.sql
CREATE TABLE TEAM_X_TOURNAMENT (
    id_team INTEGER REFERENCES TEAM(id),
    id_tournament INTEGER REFERENCES TOURNAMENT(id),
    id_group INTEGER REFERENCES GROUP(id),
    PRIMARY KEY (id_team, id_tournament)
);

-- Contents of create_table_tournament.sql
CREATE TABLE TOURNAMENT (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    id_type INTEGER NOT NULL REFERENCES TOURNAMENT_TYPE(id),
    start_date DATE,
    end_date DATE
);

-- Contents of create_table_tournament_type.sql
-- Create TOURNAMENT_TYPE table
CREATE TABLE TOURNAMENT_TYPE (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Contents of create_table_venue.sql
CREATE TABLE VENUE (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    capacity INTEGER
);

