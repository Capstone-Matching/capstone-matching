class ProfregistrationController < ApplicationController
  def index
    # This is where you can display the registration form
  end

  def create
    # Extract form parameters
    email = params[:email]
    first_name = params[:first_name]
    last_name = params[:last_name]
    
    if email.end_with?("tamu.edu")
      #check if duplicate
        #error duplicate
        #flash[:error] = "Already registered, wait for admin response before trying again"
      #else
        #add data to database
      flash[:success] = "Registration Successful! Please wait for the admin to approve your registration for access."
      redirect_to profregistration_path and return
    else
      flash[:error] = "Not a valid tamu.edu email address."
      redirect_to profregistration_path and return
    end
  end
end
