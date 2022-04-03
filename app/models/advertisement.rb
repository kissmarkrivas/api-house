class Advertisement < ApplicationRecord
  belongs_to :user
  has_one :property
  has_many :favorites, dependent: :destroy
end
