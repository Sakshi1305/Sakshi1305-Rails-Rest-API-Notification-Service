class Developer < ApplicationRecord
	has_and_belongs_to_many :teams

	validates :full_name, :email, :mobile, presence: true
	validates :mobile, format: {with: /\A(\+91)?[6-9]\d{9}\Z/}
end
