class CurrentUserController < ApplicationController
  def index
    @users = User.all
  end

end
