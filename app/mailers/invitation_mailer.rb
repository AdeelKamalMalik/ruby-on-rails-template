class InvitationMailer < ApplicationMailer
  def invite_user(user, project)
    @project = project
    @token = project.token
    mail(to: user.email, subject: 'You are invited to join a project!')
  end
end
