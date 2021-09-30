class Api::V1::UsersController < ApplicationController

    def index
        @users = User.all
        render json:@users
    end

    def show
        @user = User.find(params[:id])
        render  json:@user
    end

    def create
        @user = User.new(user_params)

        if @user.save
            
            render json: @user
        
        else
            render error: {error: 'Unable to create item' }, status: :bad_request
        end

    end

    def update
        @user = User.find(params[:id])

        if @user
            @user.update(user_params)
            render json: {message: "user Successfully updated"},status:200
        else
            render json: {error: 'Unable to Update'},status:400
        end
    end


    def destroy
        @user = User.find(params[:id])

        if @user
            @user.destroy
            render json: {message: "user Successfully updated"},status:200
        else
            render json: {error: 'Unable to Delete'},status:400
        end
    end

    private 

    def user_params
        params.permit(:username, :password)
    end
end
