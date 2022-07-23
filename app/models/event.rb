class Event < ApplicationRecord
  validate :end_date_is_after_start_date

  belongs_to :user


  def self.for_calendar(user_id)
    events = Event.where(user_id: user_id).map do |event|
      {
        id: event.id,
        title: event.label,
        start: event.datestart,
        end: event.dateend
      }
    end
    events.to_json
  end
  private

  def end_date_is_after_start_date
    return errors.add(:dateend,'dateend must be present') if !dateend.present?
    return errors.add(:datestart,'datestart must be present') if !datestart.present?
    if dateend <= datestart 
      errors.add(:dateend, 'cannot be before the start date')
    end
  end
end