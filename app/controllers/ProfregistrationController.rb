class ProfregistrationController < ApplicationController
  def index
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    # This is where you can display the registration form
=======
>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
=======
>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
=======
>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
  end

  def create
    # Extract form parameters
    email = params[:email]
    first_name = params[:first_name]
    last_name = params[:last_name]
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    
=======

>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
=======

>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
=======

>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
    if email.end_with?("tamu.edu")
      #check if duplicate
        #error duplicate
        #flash[:error] = "Already registered, wait for admin response before trying again"
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
        #redirect_to profregistration_path and return
>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
=======
        #redirect_to profregistration_path and return
>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
=======
        #redirect_to profregistration_path and return
>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
      #else
        #add data to database
      flash[:success] = "Registration Successful! Please wait for the admin to approve your registration for access."
      redirect_to profregistration_path and return
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
      #end
>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
=======
      #end
>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
=======
      #end
>>>>>>> 94009b8727de525cbdcbedf358e87a2e69730fcf
    else
      flash[:error] = "Not a valid tamu.edu email address."
      redirect_to profregistration_path and return
    end
  end
end
