class NewPages < ActiveRecord::Migration
  def up
      add_column("pages", "name", :string, :limit => 25, :after => "subject_id")
  end
    
  def down
      remove_column("pages", "name")
  end
    
end
