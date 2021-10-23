#============= SQLITE CMD ===================

# INSTALL
# linux
sudo apt-get install sqlite3 libsqlite3-dev

# Create a DB and start typing SQL queries
sqlite3 db.sqlite


#----------------------------------------------
#                  CMD

.mode column             # design    
.headers on              # entete
.read "data.sql"         # lire la db
.help                    # some cmd
.databases               # List names and files of attached databases
.clone NEWDB             # Clone data into NEWDB from the existing database
.fullschema ?--indent?   # Show schema and the content of sqlite_stat tables
.import FILE TABLE       # Import data from FILE into TABLE
.indexes ?TABLE?         # Show names of indexes
.open ?OPTIONS? ?FILE?   # Close existing database and reopen FILE
.save FILE               # Write in-memory database into FILE
.quit               

#----------------------------------------------
#                KEY WORDS

SELECT      # list column
SELECT *
SELECT i
SELECT count(*)
SELECT AVG(experience) AS avg_exp
FROM        # table
WHERE experience>10
WHERE speciality='dentist'
WHERE specciality LIKE '%surgery%'
AND 
ORDER BY experience ASC/DESC

HAVING      # ???


#----------------------------------------------
#             TABLE JOIN

SELECT *
FROM inhabitant
JOIN cities ON inhabitants.city = city.id
WHERE cities.name = "Paris"

#----------------------------------------------

# Table creation
CREATE TABLE `cities` (
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `name` VARCHAR
  );

#----------------------------------------------
#           SOME QUERRIES

# How many doctors do I have?
SELECT COUNT(*) FROM doctors

# Count cardiac surgery doctors
SELECT COUNT(*) FROM doctors WHERE specialty = 'Cardiac Surgery'

# Count all doctors per specialty
SELECT COUNT(*), specialty
FROM doctors
GROUP BY specialty

# Count all doctors per specialty, order by specialty
# You need to rename result column, with AS.

SELECT COUNT(*) AS c, specialty
FROM doctors
GROUP BY specialty
ORDER BY c DESC