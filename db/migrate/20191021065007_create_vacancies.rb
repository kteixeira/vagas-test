class CreateVacancies < ActiveRecord::Migration[5.2]
  def change
    create_table :vacancies do |t|
      t.string :company
      t.string :title
      t.string :description
      t.string :location, :limit => 1
      t.integer :level

      t.timestamps
    end
  end
end
