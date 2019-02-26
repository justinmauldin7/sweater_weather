class Favorite < ApplicationRecord
  validates_presence_of :location
  belongs_to :user

  def api_key
    user.api_key
  end
end
