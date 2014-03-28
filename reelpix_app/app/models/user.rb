class User < ActiveRecord::Base

validates(:name, { :presence => :true })
validates(:email, { :uniqueness => {:case_sensitive => false }})
validates(:password, { :length => {:minimum => 8, :maximum => 16 }})
validates(:password, :confirmation => true )
has_secure_password

end
