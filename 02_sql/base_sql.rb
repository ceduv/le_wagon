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

#-------------------------------

# instantiate doctor in ruby
john = Doctor.new(name: "John", age: 42)

# persist data in DB
DB.execute("INSERT INTO doctors (name, age) VALUES ('John', 42)")

# retrieve id from DB
id = DB.last_insert_row_id

# update ruby instance
john.id = id

#-------------------------------

last_insert_row_id

#-------------------------------

Ruby                  (ex)       DB                    (ex)
--------------------------  <=>  --------------------------
Model             (Doctor)       Table            (doctors)
Instance      (Doctor.new)       Row
Instance variable  (@name)       Column              (name)