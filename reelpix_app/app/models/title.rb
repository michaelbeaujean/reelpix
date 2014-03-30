class Title
  has_many :playlists
  has_many :users, :through => :playlists

  @base_url = "http://staging-api-us.crackle.com/Service.svc/"

end
