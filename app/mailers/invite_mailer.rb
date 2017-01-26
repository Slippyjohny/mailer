class InviteMailer < ApplicationMailer
  default from: "info@localhost"

  def existing_user_invite(invite,path)
    @invite=invite
    @link=path
    mail to: invite.email, subject: "Your Invite Link"
  end

  def new_user_invite(invite, path)
    @invite=invite
    @link=path
    mail to: invite.email, subject: "Your Invite Link"
  end
end
