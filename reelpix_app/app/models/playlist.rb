class Playlist < ActiveRecord::Base
  has_many(:titles)

  validates(:name, { :presence => :true })
end
