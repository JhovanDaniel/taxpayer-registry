class UsersController < ApplicationController
    include UsersHelper
    
    before_action :authenticate_user!
    before_action :only_admin, only: %i[index show new]
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
            flash[:notice] = "User was created successfully"
        else 
            render 'new'
        end
    end
    
    def update
        if @user.update(user_params)
            flash[:notice] = "User was updated successfully"
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def index
        @users = User.all
    end
    
    def datatable
        respond_to do |format|
            format.json { render json: UsersDatatable.new(params, view_context: view_context) }
        end
    end
    
    def edit 
    end
    
    def destroy 
        @user.destroy
        redirect_to users_path
    end
    
    def datatable
        respond_to do |format|
            format.json { render json: UserDatatable.new(params, view_context: view_context) }
        end
    end
    
    private
    
    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :access_level)
    end
    
end
