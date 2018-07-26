class CreateMethodsTable < ActiveRecord::Migration
  def change
  	create_table :methodss do |t|
  		t.text :content
  		t.integer :user_id
  	end
  end
end
