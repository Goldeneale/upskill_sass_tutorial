class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable\
         
  belongs_to :plan
  
  attr_accessor :stripe_card_token
  def save_with_subscription
    if valid?
      if plan_id == "pro"
        customer = Stripe::Customer.create(description: email, plan: 2, card: stripe_card_token)
        self.stripe_customer_token = customer.id
        save!
      end
      
      if plan_id == "basic"
        customer = Stripe::Customer.create(description: email, plan: 1, card: stripe_card_token)
        self.stripe_customer_token = customer.id
        save!
      end
      
    end
  end
end
