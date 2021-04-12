module EventsHelper
  def eventinv(event)
    Invite.where(event_id: event.id).where(user_id: current_user.id).where(attendence: false)
  end

  def invitebut(invite, event)
    out = ''
    out << (link_to 'Invitation', event, class: 'btn btn-success mt-1') if invite.any?
    out.html_safe
  end

  def invitebut2(invite, event)
    out = ''
    out << (link_to 'Invitation', event, class: 'btn btn-success mt-1') if invite.any?
    out.html_safe
  end

  def invite2
    Invite.where(event_id: params[:id]).where(user_id: current_user.id).where(attendence: false)
  end

  def invite3
    Invite.where(event_id: params[:id]).where(user_id: current_user.id).where(attendence: true)
  end

  def accept(id, event)
    out = ''
    out << (link_to 'Accept Invitation', event_invite_url(event), class: 'btn btn-success') if id.any?
    out.html_safe
  end

  def invite4(event, attendee)
    Invite.where(event_id: event.id).where(user_id: attendee.id).where(attendence: true).first
  end

  def attendee1(inv, attendee)
    return unless inv

    out = ''
    out << attendee.name.capitalize
    out.html_safe
  end

  def endin
    out = 'end'
    out.html_safe
  end

  def option(event)
    @options = []
    return unless event.creator_id == current_user.id

    User.all.each do |user|
      person = Invite.where(event_id: event.id).where(user_id: user.id)
      next if person.exists?

      @options.push([user.name, user.id]) if user.id != current_user.id
    end
    if @options.empty? || @options.nil?
      @options = ['All users are invited']
    else
      @options
    end
  end

  def formoption(form, event)
    out = ''
    return unless event.creator_id == current_user.id && event.date > Time.now

    out << (form.label :user_id, 'Friends Name:')
    out.html_safe
  end
  # rubocop:disable Lint/UnusedMethodArgument, Layout/LineLength

  def formlabel(form, options, event)
    out = ''
    return unless event.creator_id == current_user.id && event.date > Time.now

    out << (form.select :user_id, options_for_select(@options), {}, { required: 'true', autofocus: 'true', class: 'form-control' })
    out.html_safe
  end
  # rubocop:enable Lint/UnusedMethodArgument, Layout/LineLength

  def formbutton(form, event)
    out = ''
    person = Invite.where(event_id: event.id).count
    user = User.all.count
    return if person == user - 1

    return unless event.creator_id == current_user.id && event.date > Time.now

    out << (form.submit 'Invite', class: 'btn btn-primary')
    out.html_safe
  end

  def attended_users(event)
    Invite.where(event_id: event.id).where(attendence: true)
  end
end
