class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    def spend
        points = params.require(:points).to_i
        if points <=0
            render json: {error:"Cannot spend points less than or equal to 0"}
        else
            spent = Transaction.spend(points)
            render json: spent 
        end
    end
end
