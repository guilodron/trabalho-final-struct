class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.datetime :release_date
      t.string :genres
      t.text :description
      t.string :director
      t.integer :final_score

      t.timestamps
    end
  end
end
