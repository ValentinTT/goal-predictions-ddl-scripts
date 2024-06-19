CREATE TABLE TEAM_X_TOURNAMENT (
    id_team INTEGER REFERENCES TEAM(id),
    id_tournament INTEGER REFERENCES TOURNAMENT(id),
    id_group INTEGER REFERENCES GROUP(id),
    PRIMARY KEY (id_team, id_tournament)
);