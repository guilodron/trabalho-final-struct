class SessionsController < ApplicationController
    def new; end
  
    def create
      if login(params[:email], params[:password])
        redirect_to root_path
      else
        render 'new'
      end
    end
  
    def destroy
      logout
      redirect_to root_path
    end
  end