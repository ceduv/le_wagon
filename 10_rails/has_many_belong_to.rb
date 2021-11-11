#==================== HAS MANY BELONG TO ======================

# recuperer des donnes a travers une table trough: :bookmark
# on passe a travers bookmark pour avoir acces a la table movies
has_many :bookmarks
has_many :movies, through: :bookmarks, dependent: :destroy