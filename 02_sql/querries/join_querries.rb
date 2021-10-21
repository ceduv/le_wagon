#======= JOIN QUERRIES ==============

# Given a 3-table (doctors, patients, consultations) schema,
# write a single SQL query that will return all of these criteria for each consultation:
# - consultation’s date,
# - the patient’s first name and last name,
# - the doctor’s first name and last name?

SELECT c.starts_at, p.first_name, p.last_name, d.first_name, d.last_name
FROM consultations c
JOIN patients p ON c.patient_id = p.id
JOIN doctors d ON c.doctor_id = d.id;