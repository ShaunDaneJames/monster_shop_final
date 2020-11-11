class Discount < ApplicationRecord

 belongs_to :merchant
 validates_presence_of :percentage, :quantity

 validates_numericality_of :percentage, greater_than: 0, less_than: 100
 validates_numericality_of :quantity, greater_than: 0
end
