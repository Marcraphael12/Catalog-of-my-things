-- create book table with association to label

CREATE TABLE books(
  id SERIAL  primary key 
  publish_date DATE,
  publisher VARCHAR(50),
  cover_state VARCHAR(50),
  Item_id INTEGER REFERENCES Item(id),
) 

CREATE TABLE label(
  id SERIAL  primary key 
  title varchar(50),
  color varchar(50)
) 