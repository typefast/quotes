class Quote < ActiveRecord::Base
  validates :quote, presence: true, length: {minimum: 3}
  validates :author, presence: true, length: {minimum: 3}
  
  acts_as_votable
end
