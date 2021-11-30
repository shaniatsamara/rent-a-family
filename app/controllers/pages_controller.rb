class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    # landing page
  end

  def dashboard
    # page to see all your bookings / profile of the person
  end
end
