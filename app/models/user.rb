
class User < ActiveRecord::Base

# email_regex = /A\([A-Z][a-z]+$\)z/
# username_regex= /A\([a-z][0-9]\)z/

validates :f_name, presence:  true, 
				   length: {:maximum => 50  }
validates :l_name, presence:  true ,
			   length: {:maximum => 50 }
validates :username, presence: true,
		  format:  {:with => /([a-z][0-9])*/},
			length: {:maximum => 50}
		#	uniqueness: {:case_sensitive => true}
validates :email, 	presence: true,
			  format: {:with => /([A-Z][a-z])*/ },
			  uniqueness: {:case_sensitive => false} 
validates :password, presence: { message:"Pleasse provide Password.."},
		         length: { :within => 6..40, message: "Password id too short... "}

has_many :user_posts
has_many :posts, through: :user_posts, dependent: :destroy

def custom_method
	puts "Hello World!"
end
end
