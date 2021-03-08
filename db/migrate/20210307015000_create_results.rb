class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :city_number
      t.string :city1
      t.string :city2
      t.string :city3
      t.string :news_item_url
      t.string :google_image_title
      t.string :notion_url
      t.string :friend1
      t.string :friend2
      t.string :friend3
      t.string :friend4
      t.string :friend5
      t.string :location

      t.timestamps
    end
  end
end
