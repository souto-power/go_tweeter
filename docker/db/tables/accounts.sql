CREATE TABLE IF NOT EXISTS accounts (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    display_name VARCHAR(255) NOT NULL,
    password_hash CHAR(60) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    followers_count INT NOT NULL DEFAULT 0,
    following_count INT NOT NULL DEFAULT 0,
    note VARCHAR(255) NOT NULL DEFAULT "My Profile",
    avatar VARCHAR(255) NOT NULL DEFAULT "",
    header VARCHAR(255) NOT NULL DEFAULT "",
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tweets (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    account_id INT UNSIGNED NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

CREATE TABLE IF NOT EXISTS relationships (
    -- id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    following_id INT UNSIGNED NOT NULL,
    followed_id INT UNSIGNED NOT NULL,
    -- PRIMARY KEY (id),
    FOREIGN KEY (following_id) REFERENCES accounts(id) ON DELETE CASCADE,
    FOREIGN KEY (followed_id) REFERENCES accounts(id) ON DELETE CASCADE,
    PRIMARY KEY(following_id, followed_id)
);

CREATE TABLE IF NOT EXISTS attachments (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tweet_id INT UNSIGNED NOT NULL,
    media_type VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tweet_id) REFERENCES tweets(id) ON DELETE CASCADE
);