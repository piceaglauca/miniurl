class CreateMiniUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :mini_urls do |t|
      t.string :short_url
      t.text :full_url

      t.timestamps
    end
  end
end
