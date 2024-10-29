class FaqCreatedNotifier < Noticed::Base
  deliver_by :database

  def message
    "#{params[:faq][:question]} was created in #{params[:project][:name]}."
  end

  def url
    Rails.application.routes.url_helpers.project_faq_path(params[:project], params[:faq])
  end
end
