class CreateOrderMailer < ApplicationMailer
  def order_paid_email(order)
    
  end



  private

  def receipients_list
    # return [] unless @print_items.present?

    # if "production" == Rails.env
    #   MailerRecipient.pluck :email
    # else
    #   Settings.print_order[:recipient].split(',')
    # end
  end
end
