class NeedType < ApplicationRecord
    has_many :customer_needs
    has_many :customers, through: :customer_needs
end
