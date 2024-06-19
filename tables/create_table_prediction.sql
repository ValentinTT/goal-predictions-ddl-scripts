CREATE TABLE PREDICTION (
    id SERIAL PRIMARY KEY,
    id_match INTEGER REFERENCES MATCH(id),
    id_user INTEGER REFERENCES APP_USER(id),
    predicted_score_home INTEGER,
    predicted_score_away INTEGER,
);