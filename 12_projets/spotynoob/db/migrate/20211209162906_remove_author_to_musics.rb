class RemoveAuthorToMusics < ActiveRecord::Migration[6.1]
  def change
    remove_column :musics, :author
  end
end
