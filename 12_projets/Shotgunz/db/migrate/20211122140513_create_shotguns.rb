class CreateShotguns < ActiveRecord::Migration[6.0]
  def change
    create_table :shotguns do |t|
      t.references :user, null: true, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
