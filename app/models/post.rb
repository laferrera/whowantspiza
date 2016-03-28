class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  before_create :generate_slug  
  
  # def self.find_by_slug(sl)
  #   # party_id = Rails.cache.fetch("party_sl/#{sl}", :expires_in =>  Rails.configuration.cache_ttl) do
  #   #   party = self.where('slug = ? AND deleted = ?', sl.downcase, false).includes(:custom_frontend).first unless sl.nil?
  #   #   party.id unless party.nil?
  #   # end
  #   #
  #   # party = Party.find(party_id)
  #   # return party
  #   post = Post.where(slug:sl.downcase).first
  #   return post
  # end
  
  def generate_slug
    optimal_slug = self.title.parameterize
    self.slug = optimal_slug
  end
  
  def to_param
    slug
  end
  
  def grid_image_url
    if self.grid_image_id
      gi = Rich::RichFile.find self.grid_image_id
      url = JSON.parse(gi.uri_cache)["original"]
    else
      url = 'dingus.png'
    end
    return url
  end
  
  rails_admin do
    edit do
      field :title
      field :user
      field :grid_image_id, :rich_picker do
        formatted_value{ bindings[:object].id }
      end
      field :body, :rich_editor do
           config({
             :insert_many => true
           })
       end
    end
  end
end


