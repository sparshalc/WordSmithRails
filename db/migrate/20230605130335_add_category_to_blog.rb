class AddCategoryToBlog < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :category, :string
  end
end
