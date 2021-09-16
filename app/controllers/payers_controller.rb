class PayersController < ApplicationController
    def index
        render json: Payer.all
    end
end
