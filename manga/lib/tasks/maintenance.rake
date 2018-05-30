require 'csv'
namespace :maintenance do 
	task :load_ouvrage => :environment do
		CSV.foreach(Rails.root.join('db','ouvrage.csv'), headers: true) do |row|
	  		this_row = {
	    		:title => row[0],
	    		:synopsis => row[1],
	    		:begin => row[2],
	    		:final => row[3],
	    		:missing_tome => row[4],
	    		:complete => row[5],
	    		:author => row[6],
	    		:editor => row[7],
	    		:release_date => row[8],
	    		:genre => row[9],
	    		:cover => row[10]
	  		}
	  		donnee = Ouvrage.new(this_row)
	  		donnee.save!
	  	end
	end
end