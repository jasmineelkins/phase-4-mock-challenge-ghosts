class CreateGhosts < ActiveRecord::Migration[6.1]
  def change
    create_table :ghosts do |t|
      t.string :name
      t.integer :age_at_death

      t.timestamps
    end
  end
end
