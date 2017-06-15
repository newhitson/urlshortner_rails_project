class ShortenedUrl < ApplicationRecord
  validates :user_id, :long_url, :short_url, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name:  :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :user

  def self.random_code(user_id, long_url)
    short_url = nil
    until !ShortenedUrl.exists?(short_url: short_url) && short_url
      short_url = "www.#{SecureRandom.urlsafe_base64}.com"
    end
    ShortenedUrl.create!(user_id: user_id, long_url: long_url, short_url: short_url)
  end

  def num_clicks
    visits.length
  end

  def uniques
    vistors.distinct.length
  end

  def recent_uniques

  end
end


#s = ShortenedUrl.new(user_id: 1,long_url: "google.com",short_url: "go.com")
