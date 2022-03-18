# frozen_string_literal: true

class ProfilesController < ApplicationController
  # skip_before_action :authenticate_user!, raise: false
  before_action :find_profile, only: [:show]
  before_action :set_current_user_profil, only: [:edit, :update]
  
  def show; end
  
  def edit; end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to edit_profile_path, notice: 'Profile updated!' }
        format.json { render :edit, status: :ok, location: @profile }
      else
        format.html { redirect_to edit_profile_path, flash: { error: "Profile could not be updated!" } }
        format.json { render json: @profile.errors.messages, status: :unprocessable_entity }
      end
    end
  end
  
  private

  def find_profile
    @profile = Profile.find(params[:id])
  end
  
  def set_current_user_profil
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :username,
      :bio)
  end
end
