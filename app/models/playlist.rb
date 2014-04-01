class Playlist < ActiveRecord::Base
  has_many :titles
  belongs_to(:user)

  validates(:name, { :presence => :true })
end
