class HowToController < ApplicationController
  def index
    @subjects = Subject.all
  end
end
