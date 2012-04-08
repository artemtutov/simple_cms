class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
    	t.string "name", :limit => 25
    	t.integer "position", :limit => 3
    	t.boolean "visible", :default => false
		t.timestamps
    end
  end

  def self.down
    drop_table :subjects
  end
end
