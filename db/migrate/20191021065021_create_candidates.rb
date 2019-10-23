class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :profession
      t.string :location, :limit => 1
      t.integer :level

      t.timestamps
    end
  end
end
