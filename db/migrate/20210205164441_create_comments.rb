class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.string :content
      t.references :user, foreign_key: true
      t.references :pin, foreign_key: true

      t.timestamps
    end
  end
end
