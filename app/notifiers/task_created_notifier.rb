class TaskCreatedNotifier < Noticed::Base
  deliver_by :database

  def message
    "#{params[:task][:name]} was created in #{params[:project][:name]}."
  end

  def url
    Rails.application.routes.url_helpers.project_task_path(params[:project], params[:task])
  end
end
