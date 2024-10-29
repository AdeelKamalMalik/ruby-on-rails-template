class AddTokenToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :token, :string
  end
end
