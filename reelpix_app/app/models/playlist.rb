class Playlist < ActiveRecord::Base
  has_many(:titles)

  validates(:playlist_name, { :presence => :true })
end
