-- Creación de la tabla 'games' con tres columnas: 'id', 'season' y 'rank'.
CREATE TABLE games (
    id SERIAL NOT NULL,  -- 'id' es una clave primaria autoincremental.
    season SMALLINT NOT NULL,  -- 'season' almacena la temporada del juego.
    rank VARCHAR(20) NOT NULL,  -- 'rank' almacena el rango obtenido en el juego.
    PRIMARY KEY(id)  -- 'id' es la clave primaria de la tabla.
);

-- Inserción de un registro en la tabla 'games'.
INSERT INTO games (season, rank) VALUES (13, 'Gold');

-- Creación de la tabla 'teams' con cinco columnas: 'team', 'winner', 'soul', 'eldersNum' y 'gameId'.
CREATE TABLE teams (
    team VARCHAR(4) NOT NULL,  -- 'team' almacena el nombre del equipo.
    winner BOOLEAN NOT NULL,  -- 'winner' indica si el equipo ganó el juego.
    soul BOOLEAN NOT NULL,  -- 'soul' podría indicar si el equipo obtuvo un objetivo específico en el juego.
    eldersNum SMALLINT NOT NULL,  -- 'eldersNum' podría indicar el número de "ancianos" obtenidos en el juego.
    gameId INTEGER NOT NULL,  -- 'gameId' es una clave foránea que referencia a la tabla 'games'.
    PRIMARY KEY (team, gameId),  -- La clave primaria de la tabla es una combinación de 'team' y 'gameId'.
    FOREIGN KEY (gameId)  -- 'gameId' es una clave foránea que referencia a la columna 'id' de la tabla 'games'.
    REFERENCES games(id)
);

-- Inserción de registros en la tabla 'teams'.
INSERT INTO teams (team, winner, soul, eldersNum, gameId) VALUES ('Red', TRUE, TRUE, 2, 1);
INSERT INTO teams (team, winner, soul, eldersNum, gameId) VALUES ('Blue', FALSE, FALSE, 0, 1);

-- Creación de la tabla 'objects' con tres columnas: 'id', 'name' y 'description'.
CREATE TABLE objects (
    id SERIAL NOT NULL,  -- 'id' es una clave primaria autoincremental.
    name VARCHAR(50) NOT NULL,  -- 'name' almacena el nombre del objeto.
    description TEXT NOT NULL,  -- 'description' almacena una descripción del objeto.
    PRIMARY KEY(id)  -- 'id' es la clave primaria de la tabla.
);

-- Inserción de registros en la tabla 'objects'.
INSERT INTO objects (name, description)
VALUES
('Infinity Edge', 'Increases your champion''s attack damage and critical strike chance.'),
('Phantom Dancer', 'Grants attack speed and critical strike chance.'),
('Zhonya''s Hourglass', 'Grants ability power and armor. Can be activated to become invulnerable for a short time.'),
('Warmog''s Armor', 'Grants a large amount of health and health regeneration.'),
('Ravenous Hydra', 'Melee attacks deal damage to nearby enemies. Grants attack damage and lifesteal.');

-- Creación de la tabla 'runes' con tres columnas: 'id', 'name' y 'description'.
CREATE TABLE runes (
    id SERIAL NOT NULL,  -- 'id' es una clave primaria autoincremental.
    name VARCHAR(50) NOT NULL,  -- 'name' almacena el nombre de la runa.
    description TEXT NOT NULL,  -- 'description' almacena una descripción de la runa.
    PRIMARY KEY(id)  -- 'id' es la clave primaria de la tabla.
);

-- Inserción de un registro en la tabla 'runes'.
INSERT INTO runes (name, description) VALUES ('Electrocute', 'Hitting a champion with 3 separate attacks or abilities in 3s deals bonus adaptive damage.');

-- Creación de la tabla 'summoners' con tres columnas: 'id', 'name' y 'description'.
CREATE TABLE summoners (
    id SERIAL NOT NULL,  -- 'id' es una clave primaria autoincremental.
    name VARCHAR(50) NOT NULL,  -- 'name' almacena el nombre del invocador.
    description TEXT NOT NULL,  -- 'description' almacena una descripción del invocador.
    PRIMARY KEY(id)  -- 'id' es la clave primaria de la tabla.
);

-- Inserción de un registro en la tabla 'summoners'.
INSERT INTO summoners (name, description) VALUES ('Flash', 'Teleports your champion a short distance toward your cursor''s location.');

-- Creación de la tabla 'champions' con tres columnas: 'id', 'name' y 'description'.
CREATE TABLE champions (
    id SERIAL NOT NULL,  -- 'id' es una clave primaria autoincremental.
    name VARCHAR(25) NOT NULL,  -- 'name' almacena el nombre del campeón.
    description TEXT NOT NULL,  -- 'description' almacena una descripción del campeón.
    PRIMARY KEY(id)  -- 'id' es la clave primaria de la tabla.
);

-- Inserción de registros en la tabla 'champions'.
INSERT INTO champions (name, description) 
VALUES 
('Ahri', 'Ahri is a mobile mage assassin. She uses her speed and charm to catch out unsuspecting enemies.'),
('Zed', 'Zed is a melee assassin who uses his shadows to confuse and eliminate his enemies.'),
('Leona', 'Leona is a tank support who uses her solar abilities to stun and damage her enemies.'),
('Ezreal', 'Ezreal is a marksman who uses his arcane abilities to poke and burst down his enemies.'),
('Soraka', 'Soraka is a support who uses her celestial abilities to heal and protect her allies.'),
('Malphite', 'Malphite is a tank who uses his rock solid abilities to initiate fights and protect his allies.'),
('Yuumi', 'Yuumi is a support who can attach to her allies and provide healing and utility.'),
('Katarina', 'Katarina is a melee assassin who can deal a lot of damage in a short amount of time with her daggers.'),
('Jayce', 'Jayce is a versatile fighter who can switch between ranged and melee attacks.'),
('Nunu & Willump', 'Nunu & Willump are a duo who can control the jungle and help their team with crowd control and objective control.');

-- Creación de la tabla 'skills' con cuatro columnas: 'name', 'description', 'letter' y 'championId'.
CREATE TABLE skills (
    name VARCHAR(25) NOT NULL,  -- 'name' almacena el nombre de la habilidad.
    description TEXT NOT NULL,  -- 'description' almacena una descripción de la habilidad.
    letter CHAR(1) NOT NULL,  -- 'letter' almacena la letra que representa la habilidad.
    championId INTEGER NOT NULL,  -- 'championId' es una clave foránea que referencia a la tabla 'champions'.
    PRIMARY KEY(letter, championId),  -- La clave primaria de la tabla es una combinación de 'letter' y 'championId'.
    FOREIGN KEY (championId)  -- 'championId' es una clave foránea que referencia a la columna 'id' de la tabla 'champions'.
    REFERENCES champions(id)
);

-- Inserción de un registro en la tabla 'skills'.
INSERT INTO skills (name, description, letter, championId) 
VALUES 
('Orb of Deception', 'Ahri sends out and pulls back her orb, dealing magic damage on the way out and true damage on the way back.', 'Q', 1);

-- Creación de la tabla 'players' con dos columnas: 'id' y 'nickname'.
CREATE TABLE players (
    id SERIAL NOT NULL,  -- 'id' es una clave primaria autoincremental.
    nickname VARCHAR(30) NOT NULL,  -- 'nickname' almacena el apodo del jugador.
    PRIMARY KEY(id)  -- 'id' es la clave primaria de la tabla.
);

-- Inserción de registros en la tabla 'players'.
INSERT INTO players (nickname) 
VALUES 
('Faker'),
('Bjergsen'),
('Doublelift'),
('Froggen'),
('Sneaky'),
('Aphromoo'),
('Meteos'),
('Jensen'),
('Impact'),
('Pobelter');

-- Creación de la tabla 'players_gamestats' con ocho columnas: 'position', 'kills', 'deaths', 'assists', 'team', 'gameId', 'playerId' y 'championId'.
CREATE TABLE players_gamestats (
    position VARCHAR(8) NOT NULL,  -- 'position' almacena la posición del jugador en el juego.
    kills SMALLINT NOT NULL,  -- 'kills' almacena el número de asesinatos del jugador en el juego.
    deaths SMALLINT NOT NULL,  -- 'deaths' almacena el número de muertes del jugador en el juego.
    assists SMALLINT NOT NULL,  -- 'assists' almacena el número de asistencias del jugador en el juego.
    team VARCHAR(4) NOT NULL,  -- 'team' almacena el equipo del jugador.
    gameId INTEGER NOT NULL,  -- 'gameId' es una clave foránea que referencia a la tabla 'games'.
    playerId INTEGER NOT NULL,  -- 'playerId' es una clave foránea que referencia a la tabla 'players'.
    championId INTEGER NOT NULL,  -- 'championId' es una clave foránea que referencia a la tabla 'champions'.
    PRIMARY KEY(gameId, playerId),  -- La clave primaria de la tabla es una combinación de 'gameId' y 'playerId'.
    FOREIGN KEY (team, gameId)  -- 'team' y 'gameId' son claves foráneas que referencian a las columnas 'team' y 'gameId' de la tabla 'teams'.
    REFERENCES teams(team, gameId),
    FOREIGN KEY (playerId)  -- 'playerId' es una clave foránea que referencia a la columna 'id' de la tabla 'players'.
    REFERENCES players(id),
    FOREIGN KEY (championId)  -- 'championId' es una clave foránea que referencia a la columna 'id' de la tabla 'champions'.
    REFERENCES champions(id),
    UNIQUE(position, team, gameId),  -- La combinación de 'position', 'team' y 'gameId' debe ser única.
    UNIQUE(championId, gameId)  -- La combinación de 'championId' y 'gameId' debe ser única.
);

-- Inserción de registros en la tabla 'players_gamestats'.
INSERT INTO players_gamestats (position, kills, deaths, assists, team, gameId, playerId, championId)
VALUES 
('Support', 10, 5, 2, 'Red', 1, 1, 1),
('Mid', 8, 4, 3, 'Red', 1, 2, 2),
('Top', 6, 2, 5, 'Red', 1, 3, 3),
('Jungle', 4, 6, 4, 'Red', 1, 4, 4),
('ADC', 10, 3, 2, 'Red', 1, 5, 5),
('Support', 1, 12, 6, 'Blue', 1, 6, 6),
('Mid', 6, 1, 7, 'Blue', 1, 7, 7),
('Top', 4, 0, 8, 'Blue', 1, 8, 8),
('Jungle', 3, 2, 7, 'Blue', 1, 9, 9),
('ADC', 8, 0, 5, 'Blue', 1, 10, 10);


-- Creación de la tabla 'built' con tres columnas: 'gameId', 'playerId' y 'objectId'.
CREATE TABLE built (
    gameId INTEGER NOT NULL,  -- 'gameId' es una clave foránea que referencia a la tabla 'players_gamestats'.
    playerId INTEGER NOT NULL,  -- 'playerId' es una clave foránea que referencia a la tabla 'players_gamestats'.
    objectId INTEGER NOT NULL,  -- 'objectId' es una clave foránea que referencia a la tabla 'objects'.
    PRIMARY KEY(gameId, playerId, objectId),  -- La clave primaria de la tabla es una combinación de 'gameId', 'playerId' y 'objectId'.
    FOREIGN KEY (gameId, playerId)  -- 'gameId' y 'playerId' son claves foráneas que referencian a las columnas 'gameId' y 'playerId' de la tabla 'players_gamestats'.
    REFERENCES players_gamestats(gameId, playerId),
    FOREIGN KEY (objectId)  -- 'objectId' es una clave foránea que referencia a la columna 'id' de la tabla 'objects'.
    REFERENCES objects(id)
);

-- Inserción de registros en la tabla 'built'.
INSERT INTO built (gameId, playerId, objectId) 
VALUES 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5);

-- Creación de la tabla 'runes_used' con tres columnas: 'gameId', 'playerId' y 'runeId'.
CREATE TABLE runes_used (
    gameId INTEGER NOT NULL,  -- 'gameId' es una clave foránea que referencia a la tabla 'players_gamestats'.
    playerId INTEGER NOT NULL,  -- 'playerId' es una clave foránea que referencia a la tabla 'players_gamestats'.
    runeId INTEGER NOT NULL,  -- 'runeId' es una clave foránea que referencia a la tabla 'runes'.
    PRIMARY KEY(gameId, playerId, runeId),  -- La clave primaria de la tabla es una combinación de 'gameId', 'playerId' y 'runeId'.
    FOREIGN KEY (gameId, playerId)  -- 'gameId' y 'playerId' son claves foráneas que referencian a las columnas 'gameId' y 'playerId' de la tabla 'players_gamestats'.
    REFERENCES players_gamestats(gameId, playerId),
    FOREIGN KEY (runeId)  -- 'runeId' es una clave foránea que referencia a la columna 'id' de la tabla 'runes'.
    REFERENCES runes(id)
);

-- Inserción de un registro en la tabla 'runes_used'.
INSERT INTO runes_used (gameId, playerId, runeId) VALUES (1, 1, 1);

-- Creación de la tabla 'summoners_used' con tres columnas: 'gameId', 'playerId' y 'summonerId'.
CREATE TABLE summoners_used (
    gameId INTEGER NOT NULL,  -- 'gameId' es una clave foránea que referencia a la tabla 'players_gamestats'.
    playerId INTEGER NOT NULL,  -- 'playerId' es una clave foránea que referencia a la tabla 'players_gamestats'.
    summonerId INTEGER NOT NULL,  -- 'summonerId' es una clave foránea que referencia a la tabla 'summoners'.
    PRIMARY KEY(gameId, playerId, summonerId),  -- La clave primaria de la tabla es una combinación de 'gameId', 'playerId' y 'summonerId'.
    FOREIGN KEY (gameId, playerId)  -- 'gameId' y 'playerId' son claves foráneas que referencian a las columnas 'gameId' y 'playerId' de la tabla 'players_gamestats'.
    REFERENCES players_gamestats(gameId, playerId),
    FOREIGN KEY (summonerId)  -- 'summonerId' es una clave foránea que referencia a la columna 'id' de la tabla 'summoners'.
    REFERENCES summoners(id)
);

-- Inserción de un registro en la tabla 'summoners_used'.
INSERT INTO summoners_used (gameId, playerId, summonerId) VALUES (1, 1, 1);

-- Creación de una vista 'game1Players' que muestra los jugadores del juego 1.
CREATE OR REPLACE VIEW game1Players AS (
    SELECT players.nickname, champions.name AS champ, players_gamestats.position, players_gamestats.kills, players_gamestats.deaths, players_gamestats.assists, players_gamestats.team
    FROM players
    INNER JOIN players_gamestats ON players.id = players_gamestats.playerId
    INNER JOIN games ON players_gamestats.gameId = games.id
    INNER JOIN champions ON players_gamestats.championId = champions.id
    WHERE games.id = 1
    ORDER BY players_gamestats.team
);

-- Creación de una vista 'player1BuildOnGame1' que muestra los objetos construidos por el jugador 1 en el juego 1.
CREATE OR REPLACE VIEW player1BuildOnGame1 AS (
    SELECT objects.name, objects.description
    FROM objects
    INNER JOIN built ON objects.id = built.objectId
    INNER JOIN players_gamestats ON players_gamestats.gameId = built.gameId AND players_gamestats.playerId = built.playerId
    INNER JOIN games ON players_gamestats.gameId = games.id
    INNER JOIN players ON players.id = players_gamestats.playerId
    WHERE players.id = 1 AND games.id = 1
);