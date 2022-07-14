class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :datestart
      t.datetime :dateend
      t.string :location
      t.string :description
      t.string :label
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
