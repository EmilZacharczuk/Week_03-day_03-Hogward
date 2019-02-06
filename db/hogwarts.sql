
DROP TABLE students; --Remember drop order is a mirror image
DROP TABLE houses;

CREATE TABLE houses(
  id SERIAL4 PRIMARY KEY,
  house_name VARCHAR(255)
);

CREATE TABLE students(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  house INT4 REFERENCES houses(id),
  age int4
);
