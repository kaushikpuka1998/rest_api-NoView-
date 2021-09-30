class Api::V1::FactsController < ApplicationController


   
    def index
        @facts = Fact.all
        render json:@facts
    end

    def show
    
        render  json:@facts
    end

    def create
        @fact = Fact.new(user_params)

        if @fact.save
            
            render json: @fact
        else
            render error: {error: 'Unable to create item' }, status: :bad_request
        end

    end

    def update
        @fact = Facts.find(params[:id])

        if @fact
            @fact.update(user_params)
            render json: {message: "user Successfully updated"},status:200
        else
            render error: {error: 'Unable to create item' }, status: :bad_request
        end

    end


     private 

    def user_params
        params.permit(:user_id,:fact,:likes)
    end
end
