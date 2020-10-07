URL_LENGTH = 5

class MiniUrl < ApplicationRecord
  has_many :ip
  before_create :generate_mini_url

  private

  def generate_mini_url

    # generate a random string of URL_LENGTH chars. Continue loop
    # until a unique one is found.
    loop do
      self.short_url = SecureRandom.alphanumeric(URL_LENGTH)

      if ! MiniUrl.exists?(short_url: self.short_url)
        break
      end
    end
  end
end
