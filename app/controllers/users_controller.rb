class UserController < ApplicationController
 before_action :authenticate_user! if: :devise_controller?
end
