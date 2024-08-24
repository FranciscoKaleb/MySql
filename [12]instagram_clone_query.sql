CREATE DATABASE instagram_clone;
USE instagram_clone;

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

-- show all users
SELECT * FROM users;

-- show all users and their follower count
SELECT id, username, COUNT(follows.follower_id) AS followers
FROM users JOIN follows ON 
users.id = followee_id GROUP BY username
ORDER BY users.id;

-- deduct followers from user_
SELECT * FROM follows WHERE follower_id = 12;
DELETE FROM follows WHERE follower_id < 16 AND followee_id = 5;


-- show all users, follower count, followers id
SELECT 
id, 
username, 
COUNT(follows.follower_id),
GROUP_CONCAT(follower_id ORDER BY follower_id SEPARATOR ',') AS followers
FROM users JOIN follows ON 
users.id = followee_id GROUP BY username
ORDER BY users.id;

-- select 5 oldest users
SELECT * FROM users ORDER BY created_at ASC LIMIT 5;


-- most popular registration month,day

SELECT MONTH(created_at), COUNT(*) 
FROM users 
GROUP BY MONTH(created_at) 
ORDER BY COUNT(*) DESC;

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;


-- find users who never posted a photo
SELECT 
	users.id, 
    username, 
    IFNULL(COUNT(photos.image_url),0) AS photos_posted 
FROM users LEFT JOIN photos 
ON users.id = photos.user_id
GROUP BY id HAVING photos_posted = 0 ORDER BY id ASC; -- cannot be grouped by photos.user_id because those who dont post photos does not exist
 
 -- OR
 
 SELECT users.id, username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL ORDER BY users.id;



-- photos with most like

SELECT 
	photo_id, 
    COUNT(*) AS number_of_likes
FROM likes 
GROUP BY photo_id
ORDER BY COUNT(*) DESC;




SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;



-- how many times does the average user post

SELECT 
	users.id, 
    username, 
    IFNULL(COUNT(photos.image_url),0) AS photos_posted,
    AVG(IFNULL(COUNT(photos.image_url),0)) OVER() AS global_average_post
FROM users LEFT JOIN photos 
ON users.id = photos.user_id
GROUP BY id ORDER BY id ASC; 

SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
                          FROM   users) AS avg; 
 
-- top 5 hastag

SELECT 
	photo_id, 
	tag_id, 
	tag_name,
    username AS posted_by
FROM photo_tags JOIN tags JOIN photos JOIN users
ON tags.id = photo_tags.tag_id AND photos.user_id = users.id;




SELECT 
	tag_name, 
	COUNT(photo_tags.tag_id) AS 'tag count'
    FROM tags JOIN photo_tags
ON tags.id = photo_tags.tag_id 
GROUP BY tags.id 
ORDER BY COUNT(photo_tags.tag_id) DESC
LIMIT 5;

SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 


-- find user who have liked every single photo

SELECT 
	user_id, 
	COUNT(likes.user_id) AS photos_liked
FROM likes 
    GROUP BY user_id ORDER BY photos_liked DESC;

SELECT user_id, COUNT(likes.user_id) AS photos_liked
FROM likes 
GROUP BY user_id HAVING COUNT(likes.user_id) = (SELECT COUNT(*) FROM photos);


SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 


