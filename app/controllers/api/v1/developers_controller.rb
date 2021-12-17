class Api::V1::DevelopersController < ApplicationController

	def create
    @developer = Developer.new(developer_params)
    if @developer.save
    	render json: @developer
    else
    	render error: {error: 'Unable to create User.'}, status: 400
    end
  end

  private
  def developer_params
  	params.require(:developer).permit(:full_name, :email, :mobile, :team_ids)
  end
end
