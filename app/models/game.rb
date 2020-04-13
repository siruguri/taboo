class Game < ApplicationRecord
  has_many :word_selections
  has_many :words, through: :word_selections
end
