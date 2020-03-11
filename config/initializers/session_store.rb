if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "alumni_api2", domain: "alumni-api2.herokuapp.com"
else  
    Rails.application.config.session_store :cookie_store, key: "alumni_api2"
 end 
