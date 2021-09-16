class TransactionsController < ApplicationController

    def create
        transaction = Transaction.new(points:transaction_params[:points],time:transaction_params[:timestamp])
        payer = Payer.find_or_create_by(name:transaction_params[:payer].upcase)
        transaction.payer = payer
        if transaction.valid?
            transaction.save
            payer.points += transaction.points
            payer.save
            render json: transaction, include:{payer: {only: :name}}, except:[:created_at,:updated_at,:id,:payer_id]
        else
            render json: {error:"Unable to create transaction"}
        end
    end

    def index
        render json: Transaction.all
    end

    def spend
        byebug
        spent = Transaction.spend(params.require(:points))
        render json: spent 
    end

    private

    def transaction_params
        params.require(:transaction).permit(:payer,:points,:timestamp)
    end
end
