class Title < ApplicationRecord
  belongs_to :titleable, polymorphic: true
end
