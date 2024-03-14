CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL

);

CREATE TABLE difficulties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL
);

CREATE TABLE trails_copy (
    id INT,
    elevation INT
);

CREATE TABLE trails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    length DOUBLE(5, 2) NOT NULL,
    elevation DOUBLE(5, 2) NOT NULL,
    location_id INT NOT NULL,
    difficulty_id INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations(id),
    FOREIGN KEY (difficulty_id) REFERENCES difficulties(id)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    passw VARCHAR(255) NOT NULL,
    profile_type ENUM('noob', 'regular', 'pro') NOT NULL
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    trail_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    review_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (trail_id) REFERENCES trails(id)
);

CREATE TABLE ratings (
    user_id INT,
    trail_id INT,
    difficulty_id INT,
    score INT CHECK (score BETWEEN 1 AND 5) NOT NULL,
    PRIMARY KEY (user_id, trail_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (trail_id) REFERENCES trails(id),
    FOREIGN KEY (difficulty_id) REFERENCES difficulties(id)
);