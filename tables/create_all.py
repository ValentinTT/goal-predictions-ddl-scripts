import re
import os

# Define the DDL script content
ddl_script = """
-- Create VENUE table
CREATE TABLE VENUE (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    capacity INTEGER
);

-- Create TEAM table
CREATE TABLE TEAM (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    abbreviation VARCHAR(10),
    flag_name VARCHAR(255)
);

-- Create TOURNAMENT table
CREATE TABLE TOURNAMENT (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    id_type INTEGER NOT NULL REFERENCES TOURNAMENT_TYPE(id),
    start_date DATE,
    end_date DATE
);

-- Create TEAM_X_TOURNAMENT table
CREATE TABLE TEAM_X_TOURNAMENT (
    id_team INTEGER REFERENCES TEAM(id),
    id_tournament INTEGER REFERENCES TOURNAMENT(id),
    id_group INTEGER REFERENCES GROUP(id),
    PRIMARY KEY (id_team, id_tournament)
);

-- Create GROUP table
CREATE TABLE GROUP (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    id_tournament INTEGER REFERENCES TOURNAMENT(id)
);

-- Create MATCH_TYPE table
CREATE TABLE MATCH_TYPE (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create PLAYOFF_TYPE table
CREATE TABLE PLAYOFF_TYPE (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create PLAYOFF_ROUND table
CREATE TABLE PLAYOFF_ROUND (
    id SERIAL PRIMARY KEY,
    id_playoff_type INTEGER REFERENCES PLAYOFF_TYPE(id),
    id_tournament INTEGER REFERENCES TOURNAMENT(id)
);

-- Create MATCH table
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

-- Create GROUP_STANDINGS table
CREATE TABLE GROUP_STANDINGS (
    id_team INTEGER REFERENCES TEAM(id),
    id_group INTEGER REFERENCES GROUP(id),
    pos INTEGER,
    points INTEGER,
    PRIMARY KEY (id_team, id_group, pos)
);
"""

# Split the DDL script by CREATE TABLE statements
create_table_stmts = re.findall(r'CREATE TABLE\s+(\w+)\s*\((.*?)\);', ddl_script, re.DOTALL)

# Iterate through each CREATE TABLE statement and create corresponding SQL files
for table_name, table_content in create_table_stmts:
    # Construct file name
    file_name = f"create_table_{table_name.lower()}.sql"
    
    # Write the CREATE TABLE statement to the file
    with open(file_name, 'w') as file:
        file.write(f"CREATE TABLE {table_name} (\n{table_content.strip()}\n);")

    print(f"Created file: {file_name}")
