class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = current_user.projects + current_user.invited_projects
  end

  def show; end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
  end

  def invite
    @project = current_user.projects.find(params[:id])
    invited_user = User.find_by(email: params[:email])
    if invited_user
      @project.send_invitation_email(invited_user)
      flash[:notice] = "Invitation sent to #{invited_user.email}."
    else
      flash[:alert] = 'User does not exist. Please create an account.'
    end
    redirect_to @project
  end

  def accept_invite
    if user_signed_in?
      @project = Project.find_by(token: params[:token])
      if @project
        @project.users << current_user unless @project.users.include?(current_user)
        @project.users << @project.user unless @project.users.include?(@project.user)
        AcceptInvitationNotifier.with(user: { name: current_user.name }, project: { name: @project.name }).deliver_later(@project.user)
        flash[:notice] = 'You have been added to the project.'
        redirect_to project_path(@project)
      else
        flash[:alert] = 'Invalid invitation.'
        redirect_to root_path
      end
    else
      flash[:alert] = 'You need to log in to accept the invitation.'
      redirect_to new_user_session_path
    end
  end

  private

  def set_project
    @project = Project.includes(:users).find(params[:id])
    unless @project.user == current_user || @project.users.include?(current_user)
      flash[:alert] = 'You do not have access to this project.'
      redirect_to projects_path
    end
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
