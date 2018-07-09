#
# Class LoyalityPoint provides Loyality Points for each customer
# @author <vmdhoke@gmail.com>
#
module Customer
  #
  # Class LoyalityPoint provides saving of data into db
  #
  # @author Vaibhav Dhoke <vmdhoke@gmail.com>
  #
  class LoyalityPoint < ApplicationRecord
    belongs_to :shop
    after_save :send_loyality_points_email
    self.per_page = 10

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
end