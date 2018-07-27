class CreateMethodsTable < ActiveRecord::Migration
  def change
  	create_table :methods do |t|
  		t.text :content
  		t.integer :user_id
  	end
  end
end
