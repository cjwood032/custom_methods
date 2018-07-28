class CreateMephodsTable < ActiveRecord::Migration
  def change
  	create_table :mephods do |t|
  		t.text :mephodname
  		t.integer :user_id
  		t.text :language
  		t.text :description
  		t.text :mephod_data
  		t.integer :tag_id
  		t.text :tag
  	end
  end
end
