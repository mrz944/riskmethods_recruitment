class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.st_polygon :geom, srid: 4326, geographic: true

      t.timestamps
    end
  end
end
