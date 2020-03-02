PRAGMA foreign_keys = ON;

-- Dropping all the tables first
DROP TABLE question_likes;
DROP TABLE question_follows;
DROP TABLE replies;
DROP TABLE questions;
DROP TABLE users;

-- Creating a Users table
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

-- Creating a Questions table
CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

-- Creating a Question Follows table
CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  follower_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (follower_id) REFERENCES users(id)
);

-- Creating a Replies table
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

-- Create a Question Likes table
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- Put in some Users
INSERT INTO
  users (fname, lname)
VALUES
  ('Erik', 'Benton'),
  ('Utas', 'Nenaksieh'),
  ('Danny', 'D''evito');

-- Put in some questions
INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Can anyone tell ma about JOINs?',
  'SQL is silly and I don''t know how to JOIN',
    (
      SELECT
        id
      FROM
        users
      WHERE
      users.fname LIKE '%Erik%'
    )
  ),
  ('Need help with...',
  'My car won''t start',
    (
      SELECT
        id
      FROM
        users
      WHERE
      users.fname LIKE '%Utas%'
    )
  ),
  ('Who knows how to...',
  'Change my car''s oil',
    (
      SELECT
        id
      FROM
        users
      WHERE
      users.lname LIKE '%Benton%'
    )
  ),
  ('Why can''t I figure this out?',
  'Any help with the math here would be great...',
    (
      SELECT
        id
      FROM
        users
      WHERE
      users.lname LIKE '%D''evito%'
    )
  );

-- Putting some simple follows in
INSERT INTO
  question_follows (question_id, follower_id)
VALUES
  (2, 1), -- Erik follows Car Start
  (1, 3); -- Danny likes Oil Q

-- Putting in some basic replies
INSERT INTO
  replies (question_id, parent_id, author_id, body)
VALUES
  (2, NULL, 1, "My car doesn't like starting either =/"),
  (1, NULL, 3, "Try the SQLZoo demo guy");

-- Only way to self-reference the first reply
INSERT INTO
  replies (question_id, parent_id, author_id, body)
VALUES
  (2,
    (
      SELECT
        id
      FROM
        replies
      WHERE
        question_id = 2
        AND parent_id IS NULL
        AND author_id = 1
    ), 2, "Thanks for the help...");

-- Putting in some simple likes
INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1, 1),
  (3, 1),
  (2, 2),
  (1, 2);

