class Team < ApplicationRecord
	attribute :developer_ids
	has_and_belongs_to_many :developers
	has_many :messages

	validates :name, :dept_name, presence: true
end
