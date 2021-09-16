class Transaction < ApplicationRecord
    validates :time, presence:true
    validates :points, presence:true
    belongs_to :payer
end
