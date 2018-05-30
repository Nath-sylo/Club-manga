class Ouvrage < ActiveRecord::Base
  ratyrate_rateable "note"

  has_many :commentaries
  
  def self.search(search)
  	if search
  		where("title LIKE ? OR genre LIKE ? OR author LIKE ? OR editor LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  	end
  end
end

