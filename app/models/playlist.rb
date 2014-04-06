class Playlist < ActiveRecord::Base
  has_many :titles
  belongs_to(:user)

  validates(:name, { :presence => :true })

  def self.fetch_titles(string)
    @titles = []
    title_name = URI.escape(string)
      # ^ should replace spaces with %20's
    base_url = "http://staging-api-us.crackle.com/Service.svc/"
    response = HTTParty.get("#{base_url}search/media/#{title_name}/us/")
    if response["CrackleItemList"]["Count"] == "1"
        @titles << response["CrackleItemList"]["Items"]["CrackleItem"]
      return @titles
    else
      return @titles = response["CrackleItemList"]["Items"]["CrackleItem"]
    end
  end
end

# details/media/{mediaID}/{geoCode}
