class CreateCompleteds < ActiveRecord::Migration[5.2]
  def change
    create_table :completeds do |t|
      t.references :user, foreign_key: true
      t.references :todo, foreign_key: true
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
