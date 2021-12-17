class CreateDevelopers < ActiveRecord::Migration[6.1]
  def change
    create_table :developers do |t|
      t.string :full_name
      t.string :email
      t.string :mobile

      t.timestamps
    end
  end
end
