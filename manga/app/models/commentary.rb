class Commentary < ActiveRecord::Base
	belongs_to :user
	belongs_to :ouvrage
	validates_presence_of :texte
	/acts_as_votable/

	/
	def score
		self.get_upvotes.size - self.get_downvotes.size
	end
	/
end
