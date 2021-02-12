class AddNumberOfCommentsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :number_of_comments, :integer
  end
end
