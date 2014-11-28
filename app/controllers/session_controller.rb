class SessionController < ApplicationController
	skip_before_action :verify_authenticity_token 


	def create
		auth = request.env['omniauth.auth']
    user = User.find_with_omniauth(auth['uid'])
    unless user
    	user = User.create_with_omniauth(auth)
     	new_user = true
    end
    session[:user_id] = user.id
    current_user = user
   
    redirect_to root_path
  end


  def auth
    # hash = ActiveSupport::JSON.decode(request.body.read)
    token = request.headers["Authorization"]
    password = request.headers["HTTP_ANDROID_SECRET"]
    if password == "Banjarapalya"
	    response =   HTTParty.get("https://www.googleapis.com/oauth2/v2/userinfo",
	                            headers: {"Access_token"  => token,
	                                      "Authorization" => "OAuth #{token}"})
	    info = ActiveSupport::JSON.decode(response.body)
	    user = User.find_with_omniauth(info['id'])
	    if user.nil?
	    	user = User.create_by_android(info)
	     	new_user = true
	    end
	    render json: user
	  else
	  	head 404
	  end
  end
   
  def destroy

  end

  private 

  def user_check
  	unless user
    	user = User.create_with_omniauth(auth)
     	new_user = true
    end
    session[:user_id] = user.id
    current_user = user
    render json: user
  end

end
