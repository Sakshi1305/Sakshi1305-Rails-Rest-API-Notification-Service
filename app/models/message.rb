class Message < ApplicationRecord
	belongs_to :team
	validates :title, :content, presence: true

	def to_api
    hash = {
      team_id: team_id,
      sms:{
       	id: id,
       	mobiles: team.developers.pluck(:mobile),
       	content: content,
      },
      email: {
       	id: id,
       	emails:  team.developers.pluck(:email),
       	title: title,
       	content: content,
      }
    }
  end
end