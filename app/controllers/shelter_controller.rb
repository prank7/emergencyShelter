class ShelterController < ApplicationController
	skip_before_action :verify_authenticity_token 
	before_action :verified, only: [:api_shelters, :api_add_shelter]

	def add

	end

	def api_shelters
    @shelters = Shelter.all
    shelters_all = @shelters.to_json
    shelters_all = "{ shelters:" + shelters_all + "}"
    render json: shelters_all
  end

  def api_add_shelter
  	Shelter.create(name: params[:name], contact: params[:contact], latitude: params[:latitude], longitude: params[:longitude])
  	api_shelters
  end
end