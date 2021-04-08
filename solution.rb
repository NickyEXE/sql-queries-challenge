# Code your solution here!


def blue_aliens
   # return the names and colors of all the aliens that are 'blue'
   <<-SQL
   SELECT name, color FROM aliens
   WHERE color = "blue";
   SQL
end

def old_aliens
   # return the names and ages of all aliens over the age of 100
   <<-SQL
   SELECT name, age FROM aliens
   WHERE age > 100;
   SQL
end

def dangerous_aliens
   # return the names of the dangerous aliens
   <<-SQL
   SELECT name FROM aliens
   WHERE dangerous = true;
   SQL
end


def fastest_spaceship
 # return all of the info about the fastest spaceship
 <<-SQL
 SELECT * FROM spaceships
 ORDER BY speed DESC
 LIMIT 1;
 SQL
end

def aliens_aboard_fastest_spaceship
  <<-SQL
  SELECT aliens.* FROM aliens
  INNER JOIN spaceships
  ON spaceships.id = aliens.spaceship_id
  WHERE spaceships.speed = (SELECT MAX(speed) FROM spaceships);
  SQL
end


def aliens_and_spaceships
  # Return a list of all aliens and the spaceship they belong to
  <<-SQL
  SELECT aliens.*, spaceships.name FROM aliens
  INNER JOIN spaceships
  ON spaceships.id = aliens.spaceship_id;
  SQL
end


def aliens_and_planets
 # Get a list of all aliens and the planets they belong to
 <<-SQL
 SELECT aliens.*, planets.name FROM aliens
 INNER JOIN spaceships
 ON spaceships.id = aliens.spaceship_id
 INNER JOIN planets
 ON spaceships.planet_id = planets.id;
 SQL
end


def aliens_aboard_beebop
   # Get a list of all aliens aboard the spaceship named 'Beebop'
   <<-SQL
   SELECT aliens.* FROM aliens
   INNER JOIN spaceships
   ON spaceships.id = aliens.spaceship_id
   WHERE spaceships.name = "Beebop";
   SQL
end


def aliens_from_gliese
   # Get a list of all aliens from the planet named 'Gliese'
   <<-SQL
   SELECT aliens.* FROM aliens
   INNER JOIN spaceships
   ON spaceships.id = aliens.spaceship_id
   INNER JOIN planets
   ON spaceships.planet_id = planets.id
   WHERE planets.name = "Gliese";
   SQL
end

def spaceship_count_for_each_planet
  # Return each planet's name and how many spaceships are from each planet
  <<-SQL
  SELECT planets.name, COUNT(spaceships.id) AS number_of_spaceships FROM spaceships
  INNER JOIN planets
  ON planets.id = spaceships.planet_id
  GROUP BY planets.id
  ORDER BY number_of_spaceships DESC;
  SQL
end

def alien_count_for_spaceships
    # Return each spaceships's name and how many aliens are aboard each spaceship
    <<-SQL
    SELECT spaceships.name, COUNT(aliens.id) AS number_of_aliens FROM aliens
    INNER JOIN spaceships
    ON spaceships.id = aliens.spaceship_id
    GROUP BY spaceships.id
    ORDER BY number_of_aliens DESC;
    SQL
end

def alien_count_for_planets
   <<-SQL
   SELECT planets.name, COUNT(aliens.id) AS number_of_aliens FROM aliens
   INNER JOIN spaceships
   ON spaceships.id = aliens.spaceship_id
   INNER JOIN planets
   ON planets.id = spaceships.planet_id
   GROUP BY planets.id
   ORDER BY number_of_aliens DESC;
   SQL

end

def order_planets_by_aliens
   # Order the planets from most number of aliens to least number of aliens
   <<-SQL
   SELECT planets.name FROM aliens
   INNER JOIN spaceships
   ON spaceships.id = aliens.spaceship_id
   INNER JOIN planets
   ON planets.id = spaceships.planet_id
   GROUP BY planets.id
   ORDER BY COUNT(aliens.id) DESC;
   SQL
end

def spaceshisps_with_blue_aliens
   # return the names of spaceships that have blue aliens aboard
end

def spaceship_and_alien_count
  <<-SQL
  SELECT planets.name,
  COUNT(cool_table.number_of_aliens) AS number_of_spaceships,
  SUM(cool_table.number_of_aliens) AS number_of_aliens
  FROM planets
  INNER JOIN (
     SELECT spaceships.name AS spaceship_name, spaceships.planet_id AS planet_id, COUNT(aliens.id) AS number_of_aliens FROM aliens
     LEFT JOIN spaceships
     ON spaceships.id = aliens.spaceship_id
     GROUP BY spaceships.id
  ) AS cool_table
  ON cool_table.planet_id = planets.id
  GROUP BY planets.id;
  SQL
end

def order_planets_by_alien_count
   # order the planets based on how many aliens are from that planet
end

def order_planets_by_old_alien_count
   ## MOST DIFFICULT
   # order the planets based on how many aliens over the age of 100 are from that planet
   <<-SQL
   SELECT planets.name FROM aliens
   INNER JOIN spaceships
   ON spaceships.id = aliens.spaceship_id
   INNER JOIN planets
   ON spaceships.planet_id = planets.id
   WHERE aliens.age > 100
   GROUP BY planets.id
   ORDER BY COUNT(aliens.id) DESC;
   SQL
end
