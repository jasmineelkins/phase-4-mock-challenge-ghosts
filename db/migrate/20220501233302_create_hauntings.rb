class CreateHauntings < ActiveRecord::Migration[6.1]
  def change
    create_table :hauntings do |t|
      t.integer :ghost_id
      t.integer :haunted_house_id

      t.timestamps
    end
  end
end
