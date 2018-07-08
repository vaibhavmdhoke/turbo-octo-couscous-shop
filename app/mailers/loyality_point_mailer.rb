class LoyalityPointMailer < ApplicationMailer
  

  #
  # Update Customer on Email For Updated Loyality Points
  #
  #
  # @return [<type>] <description>
  # 
  def inform_customer_via_email(customer)
    @customer = customer
    mail(to: @customer.email, subject: 'You have Earned Loyality Points')
  end

end
