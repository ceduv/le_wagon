#============ add column to user model ==================

rails g migration AddFirstNameToUsers first_name:string

update default Devise strong params by adding first_name in the keys