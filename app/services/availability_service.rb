class AvailabilityService
  def bulk_update(user:, creator:, entries:)
    entries.each do |session_id, status|
      update(user:, creator:, session_id:, status:)
    end
  end

  def update(user:, creator:, session_id:, status:)
    session = EventSession.find(session_id)
    Availability.update_for_user_and_session(session, user, creator:, status:)
  end

  def bulk_update_managers(session_managers:)
    session_managers.each do |session_id, user_ids|
      session = EventSession.find(session_id)
      users = User.find(user_ids)
      update_managers(session:, users:)
    end
  end

  def update_managers(session:, users:)
    users.each do |user|
      existing = session.manager_bookings.where(user:).first

      add_manager(session:, user:) unless existing
    end
  end

  def add_manager(session:, user:)
    session.manager_bookings.create(user:, role: 'duty_manager', status: 'complete', persons: 1)
  end
end
