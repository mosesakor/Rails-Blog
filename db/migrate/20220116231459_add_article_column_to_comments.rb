class AddArticleColumnToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :post_id, :bigint
  end
end
