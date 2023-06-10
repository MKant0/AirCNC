class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # Fetch all chairs and assign them to the @chairs instance variable
    @chairs = Chair.all
  end
end
