class AcceptInvitationNotifier < Noticed::Base
  deliver_by :database

  def message
    user_name = params[:user]&.dig(:name) || "A user"
    project_name = params[:project]&.dig(:name) || "a project"
    "#{user_name} has accepted the invitation to join #{project_name}."
  end

  def url
    Rails.application.routes.url_helpers.project_path(params[:project]) if params[:project]
  end
end
