class CreateTagsTable < ActiveRecord::Migration
  def change
  	create_table :tags do |t|
  		t.text :name
  		t.integer :mephod_id
  	end
  end
end
