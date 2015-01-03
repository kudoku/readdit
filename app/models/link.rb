class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  # attr_accessor :title, :url
  before_save :sanitize_url

  private 
  def sanitize_url
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
  end
end
