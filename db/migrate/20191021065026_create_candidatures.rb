class CreateCandidatures < ActiveRecord::Migration[5.2]
  def change
    create_table :candidatures do |t|
      t.integer :id_vacancy
      t.integer :id_candidate
      t.integer :score

      t.timestamps
    end

    add_foreign_key :candidatures, :vacancies, column: :id_vacancy
    add_foreign_key :candidatures, :candidates, column: :id_candidate
  end
end
