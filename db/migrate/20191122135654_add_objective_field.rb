class AddObjectiveField < ActiveRecord::Migration[5.2]
    def change
        add_column :candidates, :objective, :string
    end
end
