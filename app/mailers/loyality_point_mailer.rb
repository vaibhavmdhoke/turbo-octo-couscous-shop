#
# Class LoyalityPointMailer provides info to customer as email on their loyality Points
# after each purchase   
# @author Vaibhav Dhoke <vmdhoke@gmail.com>
#
class LoyalityPointMailer < ApplicationMailer
  #
  # Update Customer on Email For Updated Loyality Points
  #
  #
  # @return [<type>] <description>
  #
  def inform_customer_via_email(customer)
    @customer = customer.reload
    mail(to: @customer.email, subject: 'You have Earned Loyality Points')
  end
end
