class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.integer :value_index
      t.string :source_type

      t.timestamps
    end

    add_index :sources, :name, unique: true
  end
end
