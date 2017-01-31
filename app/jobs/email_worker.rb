class EmailWorker
  include Sidekiq::Worker
  def perform invite_id, redirect_url
    invite=Invite.find(invite_id)
    InviteMailer.new_user_invite(invite, redirect_url).deliver
  end
end