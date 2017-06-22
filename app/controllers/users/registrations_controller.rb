class Users::RegistrationsController < Devise::RegistrationsController
    def create
        super do |resource|
            if params[:plan]
                if params[:plan] == "pro"
                    resource.plan_id = 2
                    resource.save_with_subscription
                else
                    resource.save
                end
            end
        end
    end
end