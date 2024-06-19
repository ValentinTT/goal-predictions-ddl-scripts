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