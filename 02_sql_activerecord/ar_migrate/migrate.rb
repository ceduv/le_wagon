# En ajoutant une table de jointure categories_postsdans votre base de données :

class CreateCategoriesPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_posts do |t|
      t.references :post, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end

# Et en utilisant throughdans vos associations des instructions dans vos classes de modèles :

class Post < ActiveRecord::Base
  has_many :categories_posts
  has_many :categories, through: :categories_posts
end

class Category < ActiveRecord::Base
  has_many :categories_posts
  has_many :posts, through: :categories_posts
end

# Et n'oubliez pas d'ajouter le belongs_todans le nouveau CategoriesPostmodèle :
class CategoriesPost < ActiveRecord::Base
  belongs_to :category
  belongs_to :post
end