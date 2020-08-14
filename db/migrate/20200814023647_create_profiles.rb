class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :age_id, null:false
      t.string :profession_id, null:false
      t.timestamps
    end
  end
end
