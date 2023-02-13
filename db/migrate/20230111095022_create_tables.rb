class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end

    create_table :courses do |t|
      t.belongs_to :author, foreign_key: true, null: false

      t.string :name, null: false
      t.text :description

      t.timestamps
    end

    create_table :talents do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end

    create_join_table :courses, :talents
  end
end
