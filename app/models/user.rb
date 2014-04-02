class User < ActiveRecord::Base
  has_many(:playlists)

validates(:name, { :presence => :true })
validates(:username, { :presence => :true})
validates(:email, { :uniqueness => {:case_sensitive => false }})
# password validation is preventing users from editing their profiles
validates(:password, { :length => {:minimum => 8, :maximum => 16 }})
validates(:password, :confirmation => true )
has_secure_password

end
