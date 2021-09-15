class Transaction < ApplicationRecord
    validates :time, presence:true
    validates :points, presence:true
    belongs_to :payer

    def payer_name
        self.payer.name if self.payer
    end
end
