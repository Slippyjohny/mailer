class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.role=="admin"
      can :manage, :all
    else
      can :index, Event
      can :show, Event do |event|
        event.user_id==user.id
      end
      can :show, Event do |event|
        event.attached_user_ids.include?(user.id)
      end
      can :create, Event
      can [:update, :edit, :destroy], Event do |event|
        event.user_id==user.id
      end
      can [:new,:create, :show,], Document
      can :destroy, Document do |doc|
        doc.user_id==user.id
      end
      can [:new,:create], Invite
      can :create, Comment
      can [:destroy], Comment do |comment|
        comment.user_id==user.id
      end
    end
  end
end