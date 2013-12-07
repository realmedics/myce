class CreateCes < ActiveRecord::Migration
  def change
    create_table :ces do |t|
      t.string :title
      t.integer :hours

      t.timestamps
    end
  end
end
