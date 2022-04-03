class Property < ApplicationRecord
  belongs_to :advertisement
  has_one :location
end
