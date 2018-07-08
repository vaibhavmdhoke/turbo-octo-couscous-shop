#
# Class LoyalityPoint provides Loyality Points for each customer 
# TODO: uniq email migration 
# @author <vmdhoke@gmail.com>
#
class LoyalityPoint < ApplicationRecord
  belongs_to :shop
  after_save :send_loyality_points_email

  def full_name
    "#{first_name} #{last_name}"  
  end

  #
  # this will send loyality points email to customer
  #
  def send_loyality_points_email
    ### check for email for queue
    LoyalityPointMailer.inform_customer_via_email(self).deliver_later  # (queue: 'email_queue')
    true
  end
end
