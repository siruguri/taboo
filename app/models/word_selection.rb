class WordSelection < ApplicationRecord
  belongs_to :word
  belongs_to :game

  enum status: {
         active: 0,
         inactive: 1
       }
end
