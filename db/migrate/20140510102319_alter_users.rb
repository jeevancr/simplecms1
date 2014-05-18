class AlterUsers < ActiveRecord::Migration
  def change
      add_column("users", "username", :string, :limit => 25, :after => "email")
  end
end
