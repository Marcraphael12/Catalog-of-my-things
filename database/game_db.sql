-- create table Game (
--   multiplayer BOOLEAN,
--   last_played_at DATE
-- )

create table Authors (
  id  INT generated always as identity,
  first_name varchar(500),
  last_name varchar(500),
  primary key(id),

-- a reference to the item table
  foreign key(id) references item(id)
)