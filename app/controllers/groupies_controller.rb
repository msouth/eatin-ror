class GroupiesController < ApplicationController
  def create
  	@group = Group.find(groupie_params[:group_id])
  	@user = User.find(groupie_params[:user_id])
  	if @group.users << @user
  		redirect_to @group
  	else
  		redirect_to groups_path
	  end
  end

  def update
    @groupie = Groupie.find(params[:id])
    @groupie.update_attributes(accepted: true)
    redirect_to @groupie.group
  end

  def destroy
    Groupie.find(params[:id]).destroy
    redirect_to groups_path
  end

  private

  def groupie_params
  	params.require(:groupie).permit(:user_id, :group_id)
  end
end
