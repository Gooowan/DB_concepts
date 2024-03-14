CREATE TABLE locations_copy LIKE locations;
CREATE INDEX location_id ON locations_copy (id);

INSERT INTO locations_copy(name, country, region, latitude, longitude)
SELECT name, country, region, latitude, longitude FROM locations;