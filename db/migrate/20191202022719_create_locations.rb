class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.references :area, foreign_key: true
      t.st_point :geom, srid: 4326, geographic: true
      t.string :name

      t.timestamps
    end
  end
end
