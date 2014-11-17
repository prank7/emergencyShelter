class UserController < ApplicationController
   before_action :verified, only: [:api_index]

  def index
    @user = User.all
    userc = @user.to_json
    userc = "{ users:" + userc + "}"
    render json: userc
  end

  def edit
  end

  def show
  end

  def destroy
  end

  def api_index
    @user = User.all
    userc = @user.to_json
    userc = "{ users:" + userc + "}"
    render json: userc
  end

  def api_show
  end

  def api_destroy
  end

  def api_edit
  end

  private
  def verified
    if User.where(api_key: request.headers["HTTP_API_KEY"]).first
      return true 
    else
     head 403
    end
  end

end
