-------------------------------------------- DDL -> CREATE, ALTER, DROP -----------------------------------------------

CREATE TABLE persons(
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (id)
)

SELECT * FROM persons

------------------------------ ALTER ----------------------------

ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL

---- Remove column phone from persons table -----------

ALTER TABLE persons
DROP COLUMN phone

----- Delete table persons from the database ------

DROP TABLE persons













