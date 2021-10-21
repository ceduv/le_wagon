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