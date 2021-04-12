module InvitesHelper
  def attent(inv)
    inv.attendence = true
    inv.save
  end
end
