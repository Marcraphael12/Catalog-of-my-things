create table if not exists item (
  id  INT generated always as identity,
  -- label_id int,
  -- genre_id int,
  author_id int,
  publish_date date,
  archived boolean,
  primary key(id),
  -- foreign key (label_id) references labels (id),
  -- foreign key (genre_id) references genres (id),

  -- reference to the author table
  foreign key (author_id) references authors (id)
);

create table Game (
  multiplayer BOOLEAN,
  last_played_at DATE
)

create table Authors (
  id  INT generated always as identity,
  first_name varchar(500),
  last_name varchar(500),
  primary key(id),

-- a reference to the item table
  foreign key(id) references item(id)
)

-- create book table with association to label

CREATE TABLE books(
  id SERIAL  primary key 
  publish_date DATE,
  publisher VARCHAR(50),
  cover_state VARCHAR(50),
  Item_id INTEGER REFERENCES item(id),
) 

CREATE TABLE label(
  id SERIAL  primary key 
  title varchar(50),
  color varchar(50)
) 
