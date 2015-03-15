class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :name
      t.string :type
      t.string :title
      t.text :description
      t.date :shoot_date
      t.date :witness_date

      t.timestamps null: false
    end
  end
end
