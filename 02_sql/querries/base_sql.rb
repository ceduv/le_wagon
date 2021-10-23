#============ BASE =============

# creer db.sqlite

sqlite3 db.sqlite

#-------------------------------

# refacto

SELECT * FROM doctors
JOIN consultations ON doctors.id = consultations.doctor_id;
#===
SELECT * FROM doctors d
JOIN consultations c ON d.id = c.doctor_id;

#-------------------------------

DB.results_as_hash = true

doctors = DB.execute("SELECT name, age FROM doctors")
# => [
#      { "name" => "John Smith", "age" => 39 , 0 => "John Smith", 1 => 39 },
#      { "name" => "Emma Reale", "age" => 31 , 0 => "Emma Reale", 1 => 31 }
#    ]