class CreateIps < ActiveRecord::Migration[5.2]
  def change
    create_table :ips do |t|
      t.string :ip
      t.integer :num_visits
      t.integer :mini_url_id

      t.timestamps
    end
    add_index :ips, :mini_url_id
  end
end
