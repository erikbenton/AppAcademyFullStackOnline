# require 'SecureRandom'

class ShortenedUrl < ApplicationRecord
  # validates :short_url, :long_url, :user_id, presence: true
  # validates :short_url, uniqueness: true

  # def self.random_code
  #   random = SecureRandom.urlsafe_base64
  #   until ShortendedUrl.exists?('short_url' => random)
  #     random = SecureRandom.urlsafe_base64
  #   end
  #   random
  # end
end