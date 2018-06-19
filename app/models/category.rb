class Category < ApplicationRecord
    has_many :questions_categories
    has_many :questions, through: :questions_categories
    validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
end
