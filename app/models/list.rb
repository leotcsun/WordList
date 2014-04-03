class List < ActiveRecord::Base
  has_many :words

  validates :name, :uniqueness => true
end
