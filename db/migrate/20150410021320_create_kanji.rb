class CreateKanji < ActiveRecord::Migration
  def change
    create_table :kanjis do |t|
      t.string :kanji
      t.integer :count

      t.timestamps
    end
  end
end
