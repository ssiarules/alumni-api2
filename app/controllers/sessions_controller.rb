class SessionsController < ApplicationController

    def create 
    user = User
            .find_by(email: params["user"]["email"]) #finds whatever user in the system witht the email we pass up 
            .try(:authenticate, params["user"]["password"]) #if user name and email matches now will authenicate the password if a match will store user in the variable

#if the user was created communicate with the session, we want to set the user id = to the user ID we just found, this will implement the cookie in the user browser.
#if user not able to log in it will get a status of 401 meaning they are not aunthenticated. 
            if user 
                    session[:user_id] = user.user_id
                    render json: {
                        status: :created, 
                        logged_in: true, 
                        user: user 
                    }
               else  
                render json: { status: 401}
         end 
    end 
end 