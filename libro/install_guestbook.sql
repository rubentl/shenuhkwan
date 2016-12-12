CREATE TABLE guestbook (
  ID int(5) NOT NULL auto_increment,
  name text NOT NULL,
  email text NOT NULL,
  comments text NOT NULL,
  time datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (ID)
)
