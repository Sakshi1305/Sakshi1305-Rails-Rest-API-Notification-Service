class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.string :title
      t.belongs_to :team

      t.timestamps
    end
  end
end
