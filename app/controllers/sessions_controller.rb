class SessionsController < ApplicationController
   #make sure that current user is in session
    include CurrentUserConcern


    def create 
    user = User
            .find_by(email: params["user"]["email"]) #finds whatever user in the system witht the email we pass up 
            .try(:authenticate, params["user"]["password"]) #if user name and email matches now will authenicate the password if a match will store user in the variable

#if the user was created communicate with the session, we want to set the user id = to the user ID we just found, this will implement the cookie in the user browser.
#if user not able to log in it will get a status of 401 meaning they are not aunthenticated. 
            if user 
                    session[:user_id] = user.id
                    render json: {
                        status: :created, 
                        logged_in: true, 
                        user: user 
                    }
               else  
                render json: { status: 401}
         end 
    end 

#if user is logged in, we see their session ID,and we send it back with their user account
#if they are logged in or current user  
        def logged_in 
            if @current_user
            render json: {
                logged_in: true, 
                user: @current_user
            }
            else  
            render json: {
                logged_in: false 
            }
            end 
        end 

        def logout 
            reset_session
            render json: { status: 200, logged_out: true }

        end 
end 