class Visit < ApplicationRecord
  validates :user_id, :shortened_url, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl

  def self.record_visit!(user_id, s_url_id)
    Visit.create!(user_id: user_id, shortened_url_id: s_url_id)
  end
end
