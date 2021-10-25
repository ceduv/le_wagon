#=================  CMD  =======================

gem install activerecord -v 6.0

rake db:create      # Creates your database
rake db:drop        # Destroys your whole database
rake db:migrate     # Runs any migrations that haven't already been run
rake db:version     # Retrieves the current schema version number
rake db:seed        # Populates your database with sample data
rake db:timestamp   # Gives you a timestamp for your migration file name
rake -T             # List all tasks

# Voici une commande utile pour supprimer votre base de données,
# la recréer, migrer le schéma et l'amorcer
rake db:drop db:create db:migrate db:seed

::find_by
# returns the first record verifying the condition,
::where
# returns every record verifying the condition, in an array.
Note that ::where always returns an array (even if there’s zero or one result), and ::find_by returns an instance or nil!


SELECT * FROM restaurants WHERE rating >= 4 ORDER BY rating ASC LIMIT 5;
#===
Restaurant.where("rating >= 4").order(rating: :asc).first(5)