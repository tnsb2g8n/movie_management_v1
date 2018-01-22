class Movie < ApplicationRecord
  acts_as_paranoid
  belongs_to :movie_category
end
