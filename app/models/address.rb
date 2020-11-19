class Address < ApplicationRecord
  belong_to :purchaser
  belongs_to :area
end
