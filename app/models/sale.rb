class Sale < ActiveRecord::Base
	before_create :populate_guid
	belongs_to :kitchen
	

	private

	def populaute_guid
		self.guid = SecureRandom.uuid()
	end
end