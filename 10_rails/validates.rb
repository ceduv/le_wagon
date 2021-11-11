#========= VALIDATES =================

# validates presence & uniqueness
class Restaurant < ApplicationRecord
    validates :address, presence: true, uniqueness: true
end

# validates range
class Restaurant < ApplicationRecord
    validates :rating, inclusion: { in: [0,1,2,3], allow_nil: false }
end

# association unique
# foreign key (table de jointure)
validates :movie_id, uniqueness: { scope: :list_id }
