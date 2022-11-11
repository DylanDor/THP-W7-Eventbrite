class Admin::AdminController < ApplicationController
    before_action :is_admin?

    def index
        @users = User.all
        @events = Event.all
    end

    private

    def is_admin?
        unless current_user.is_admin == true
          flash[:danger] = "Accès refusé. Vous n'êtes pas administrateur de ce site."
          redirect_to root_path
        end
      end

end
