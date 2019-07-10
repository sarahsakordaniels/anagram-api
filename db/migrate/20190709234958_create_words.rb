class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :spelling
      t.references :anagrams, foreign_key: true
    end
  end
end
