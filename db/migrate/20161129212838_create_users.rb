class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.boolean :receiveMarketing
      t.boolean :receiveArticles
      t.boolean :receiveDigest

      t.timestamps
    end
  end
end
