class MovieCategory < ApplicationRecord
  acts_as_paranoid
  belongs_to :service
  has_many :movies
end
