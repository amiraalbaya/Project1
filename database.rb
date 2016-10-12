require 'sqlite3'
class DBHandler
	def initialize()
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "CREATE TABLE IF NOT EXISTS Students (ID INTEGER PRIMARY KEY,andrewid TEXT , firstname TEXT, lastname TEXT, major TEXT, email TEXT, graduate TEXT)"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occurred"
			puts e
		ensure
			db.close if db
		end
	end
	def create( andrewid, firstname, lastname, email, major, graduate)
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "INSERT INTO Students(andrewid,firstname, lastname, major, email, graduate)VALUES ('#{andrewid}', '#{firstname}', '#{lastname}', '#{major}', '#{email}', '#{graduate}')"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occurred"
			puts e
		ensure
			db.close if db
		end
	end
	def all()
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "SELECT * FROM Students"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occurred"
			puts e
		ensure
			db.close if db
		end
	end

	def allgrads()
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "SELECT * FROM Students WHERE graduate = 'yes' or graduate='YES' or graduate='Yes' "
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occurred"
			puts e
		ensure
			db.close if db
		end
	end

	def nongrads()
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "SELECT * FROM Students WHERE graduate = 'no' or graduate = 'NO' or graduate='No'"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occurred"
			puts e
		ensure
			db.close if db
		end
	end		

	def get(val)
		begin
			db = SQLite3::Database.open "student.db"

			dbstatement = "SELECT * FROM Students WHERE id = '#{val}'"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occurred"
			puts e
		ensure
			db.close if db
		end
	end
	def update(id, andrewid, firstname, lastname, email, major, graduate)
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "UPDATE Students SET andrewid='#{andrewid}', firstname='#{firstname}', lastname='#{lastname}', major='#{major}', email='#{email}', graduate='#{graduate}'  WHERE ID='#{id}'"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occurred"
			puts e
		ensure
			db.close if db
		end
	end
	def destroy(id)
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "DELETE FROM Students WHERE ID='#{id}'"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occurred"
			puts e
		ensure
			db.close if db
		end
	end
end
