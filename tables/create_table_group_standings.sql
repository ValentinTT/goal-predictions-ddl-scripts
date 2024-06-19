CREATE TABLE GROUP_STANDINGS (
    id_team INTEGER REFERENCES TEAM(id),
    id_group INTEGER REFERENCES GROUP_ZONE(id),
    pos INTEGER,
    points INTEGER,
    PRIMARY KEY (id_team, id_group, pos)
);