class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.point "lonlat", :srid => 4326, :geographic => true
      t.string "icon"
      t.timestamps
    end

    add_index(:markers, :lonlat, :spatial => true)
  end
end
