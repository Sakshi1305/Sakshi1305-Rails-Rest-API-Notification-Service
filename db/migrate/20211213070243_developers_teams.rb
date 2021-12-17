class DevelopersTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :developers_teams, id: false do |t|
      t.belongs_to :developer
      t.belongs_to :team
    end
  end
end
