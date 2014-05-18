class NewJoin < ActiveRecord::Migration
  def change
      rename_table("users_pages", "pages_users")
  end
end
