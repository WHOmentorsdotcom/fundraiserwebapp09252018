class DonationController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:ipn, :index]

    def index
    end
  
    def checkout
    end

    def prefill
        @donor = Donor.find_or_create_by(:email => params[:email])
    
        if Settings.use_contribution_options
          contribution_option_id = params['contribution_option']
          raise Exception.new("No contribution option was selected") if contribution_option_id.nil?
          contribution_option = ContributionOption.find(contribution_option_id)
          pledge = contribution_option.amount
        else
          pledge = Settings.pledge
        end
    
        @gift = Gift.prefill!(:name => Settings.product_name, :pledge => pledge, :donor_id => @donor.id, :contribution_option => contribution_option)
        
      end

      def share
        @gift = Gift.find_by(:udid => params[:udid])
      end
    
      def ipn
      end

end
