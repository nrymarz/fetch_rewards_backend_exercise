class Transaction < ApplicationRecord
    validates :time, presence:true
    validates :points, presence:true
    belongs_to :payer

    def self.spend(points)
        spent = {}
        Transaction.all.sort_by{|t| t.time}.map do |transaction|
            if points == 0
                break
            elsif transaction.points < points
                points -= transaction.points
                transaction.payer.points -= transaction.points
                spent[transaction.payer.name.to_sym] = (spent[transaction.payer.name.to_sym] || 0) + transaction.points
            else
                points = 0
                transaction.payer.points -= points
                spent[transaction.payer.name.to_sym] = (spent[transaction.payer.name.to_sym] || 0) + points
            end
            transaction.payer.save
            spent
        end
    end
end
