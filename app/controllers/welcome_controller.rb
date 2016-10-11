class WelcomeController < ApplicationController
  def index
  end

  def create
  	response = {:success => false}
  	@source = Source.new(params[:source])
  	if @source.save
  		response.success = true
 	end
 	render :json => response.to_json
 end 
end
