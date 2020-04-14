class Word < ApplicationRecord
  has_many :games, inverse_of: :word
end
