class Service < ApplicationRecord
  acts_as_paranoid
  has_many :users
  has_many :service_managers
  has_many :movie_categories
end
