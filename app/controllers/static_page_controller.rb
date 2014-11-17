class StaticPageController < ApplicationController
	before_action :verified, only: [:api_shelters]

	def index
		@shelters = Shelter.all
		@hash = Gmaps4rails.build_markers(@shelters) do |shelter, marker|
      marker.lat shelter.latitude
      marker.lng shelter.longitude
      marker.json({:id => shelter.id })
      marker.title shelter.address
      marker.picture({
			  "width" =>  32,
        "height" => 32})
    end
 	end

  def api_shelters
  	@shelters = Shelter.all
  	shelters_all = @shelters.to_json
    shelters_all = "{ shelters:" + shelters_all + "}"
    render json: shelters_all
  end


end
