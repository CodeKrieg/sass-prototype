class AddSocialLinks < ActiveRecord::Migration
  def change
    add_column :users, :facebook, :string
    add_column :users, :gmail, :string
    add_column :users, :github, :string
  end
end
