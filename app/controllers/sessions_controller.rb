class SessionsController < ApplicationController
    def google_auth
      auth_hash = request.env['omniauth.auth']
      user = User.find_by(email: auth_hash['info']['email'])
      
      if !auth_hash['info']['email'].ends_with?('tamu.edu')
        flash[:error] = "Must login with tamu.edu email."
        redirect_to root_path
        return
      end

      if user
        # User exists, log them in
        session[:user_id] = user.user_id
      else
        # User doesn't exist, create a new user
        user = User.create(
          email: auth_hash['info']['email'],
          first_name: auth_hash['info']['first_name'],
          last_name: auth_hash['info']['last_name'],
          role: 'student'
        )
        session[:user_id] = user.user_id
      end
    
      if user.valid?
        session[:user_id] = user.user_id
      else
        flash[:error] = "User creation failed: #{user.errors.full_messages.join(', ')}"
        puts(user.errors.full_messages)
        redirect_to root_path
        return
      end

      
      if user.role == 'student'
        flash[:success] = "Logged in sucessfully."
        redirect_to studentform_path
      elsif user.role == 'professor'
        professor = Professor.where(professor_id: user.user_id)
        if professor.exists?
          professor = professor.first
          if professor.verified == false
            flash[:error] = "Please wait for admin to approve you before logging in."
            session[:user_id] = nil
            redirect_to root_path
          else
            flash[:success] = "Logged in sucessfully."
            redirect_to profLanding_path
          end
        else
         session[:user_id] = nil
          flash[:error] = "Have role: professor, but not found in Professor table, contact admin."
          redirect_to root_path
        end
      elsif user.role == 'admin'
        flash[:success] = "Logged in sucessfully."
        redirect_to adminlanding_path
      else
        session[:user_id] = nil
        flash[:error] = "Error logging in, please contact the admin."
        redirect_to root_path
      end
    end
  
    def destroy
      session[:user_id] = nil
      flash[:success] = "Logged out successfully."
      redirect_to root_path
    end
  end
  
  