class Api::V1::TeamsController < ApplicationController
	def create
    @team = Team.new(team_params)
    if @team.save
    	render json: @team.to_json(include: :developers)
    else
    	render error: {error: 'Unable to create team.'}, status: 400
    end
  end

  def update
  	@team = Team.find(params[:id])
  	if @team
  		@team.update(team_params)
  		render json: @team
    else
      render json: { error: 'Unable to update team' }, status: 400
    end
  end

  private
  def team_params
  	params.require(:team).permit(:name, :dept_name, :developer_ids)
  end
end
