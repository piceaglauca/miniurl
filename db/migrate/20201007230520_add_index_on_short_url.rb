class AddIndexOnShortUrl < ActiveRecord::Migration[5.2]
  def change

    add_index :mini_urls, :short_url
  end
end
