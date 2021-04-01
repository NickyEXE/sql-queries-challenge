# Code your solution here!


def blue_aliens
   # return the names and colors of all the aliens that are 'blue'
   "SELECT name, color FROM aliens WHERE color = 'blue';"
end

def old_aliens
   # return the names and ages of all aliens over the age of 100
   "SELECT name, age FROM aliens WHERE age > 100;"
end

def dangerous_aliens
   # return the names of the dangerous aliens
   "SELECT name FROM aliens WHERE dangerous = true;"
end


def fastest_spaceship
 # return all of the info about the fastest spaceship
   "SELECT * FROM spaceships
   ORDER BY speed DESC
   LIMIT 1;"
end

def aliens_aboard_fastest_spaceship
  #return a list of the aliens aboard the fastest spaceship
  "SELECT aliens.*, spaceships.* FROM aliens
   INNER JOIN spaceships
   ON aliens.spaceship_id = spaceships.id
   WHERE speed = (SELECT MAX(speed) FROM spaceships);"
end


def aliens_and_spaceships
  # Return a list of all aliens and the spaceship they belong to
   "SELECT aliens.name, spaceships.name FROM aliens
   INNER JOIN spaceships
   ON aliens.spaceship_id = spaceships.id;"
end


def aliens_and_planets
 # Get a list of all aliens and the planets they belong to
 "SELECT aliens.name, planets.name FROM aliens
 INNER JOIN spaceships
 ON aliens.spaceship_id = spaceships.id
 INNER JOIN planets
 ON spaceships.planet_id = planets.id;"
end


def aliens_aboard_beebop
   # Get a list of all aliens aboard a the spaceship named 'Beebop'
   "SELECT aliens.* FROM aliens
   INNER JOIN spaceships
   ON aliens.spaceship_id = spaceships.id
   WHERE spaceships.name = 'Beebop';"
end


def aliens_from_gliese
   # Get a list of all aliens from the planet named 'Gliese'
   "SELECT aliens.* FROM aliens
   INNER JOIN spaceships
   ON aliens.spaceship_id = spaceships.id
   INNER JOIN planets
   ON spaceships.planet_id = planets.id
   WHERE planets.name = 'Gliese'
   ;"
end

def spaceship_count_for_each_planet
  # Return each planet's name and how many spaceships are from each planet
   "SELECT planets.name, COUNT(*) AS number_of_spaceships FROM planets
  INNER JOIN spaceships
  ON  spaceships.planet_id = planets.id
  GROUP BY spaceships.planet_id;"
end

def alien_count_for_spaceships
    # Return each spaceships's name and how many aliens are aboard each spaceship
    "SELECT spaceships.name, COUNT(*) AS number_of_aliens FROM spaceships
    INNER JOIN aliens
    ON spaceships.id = aliens.spaceship_id
    GROUP BY spaceships.id;"
end

def alien_count_for_planets
    #
    "SELECT planets.name, COUNT(*) FROM aliens
    LEFT JOIN spaceships
    ON spaceships.id = aliens.spaceship_id
    INNER JOIN planets
    ON planets.id = spaceships.planet_id
    GROUP BY planet_id;"

end

def order_planets_by_aliens
   # Order the planets from most number of aliens to least number of aliens
end

def spaceshisps_with_blue_aliens
   # return the names of spaceships that have blue aliens aboard
end

def spaceship_and_alien_count
  # return a count of all spaceships from a planet and the total number of aliens from that planet
end

def order_planets_by_alien_count
   # order the planets based on how many aliens are from that planet
end

def order_planets_by_old_alien_count
   ## MOST DIFFICULT
   # order the planets based on how many aliens over the age of 100 are from that planet
end
