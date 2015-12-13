class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.float :literacy_rate
      t.float :imr
      t.float :gdp
      t.float :gdp_per_capita
      t.float :total_renewable
      t.float :hydro_power
      t.float :wind_power
      t.float :biomass
      t.float :solar_power
      t.float :geothermal
      t.float :percent_total
      t.string :region
      t.string :analysis
      t.timestamps null: false
    end
  end
end
