class CreateAnagrams < ActiveRecord::Migration[5.2]
  def change
    create_table :anagrams do |t|

      t.timestamps
    end
  end
end
