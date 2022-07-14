class Event < ApplicationRecord
  validate :end_date_is_after_start_date

  belongs_to :user


  private

  def end_date_is_after_start_date
    return errors.add(:dateend,'dateend must be present') if !dateend.present?
    return errors.add(:datestart,'datestart must be present') if !datestart.present?
    if dateend <= datestart 
      errors.add(:dateend, 'cannot be before the start date')
    end
  end
end