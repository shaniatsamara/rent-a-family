class FamiliesController < ApplicationController
  def index
    if params[:search].present?
      @search = params[:search][:query]
      @families = Family.where("title ILIKE ? OR ethnicity ILIKE ?", "%#{@search}%", "%#{@search}%")
    else
      @families = Family.all
    end
    @markers = @families.geocoded.map do |family|
      {
        lat: family.latitude,
        lng: family.longitude,
        info_window: render_to_string(partial: "info_window", locals: { family: family })
      }
    end
  end

  def show
    @family = Family.find(params[:id])
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    @family.user = current_user
    @family.save
    redirect_to family_path(@family)
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
    @family = Family.find(params[:id])
    @family.update(family_params)

    redirect_to family_path(@family)
  end

  def destroy
    @family = Family.find(params[:id])
    @family.delete
    redirect_to families_path
  end

  private

  def family_params
    params.require(:family).permit(:ethnicity, :price, :description, :location, :title, :adult_male, :adult_female,
                                   :child_male, :child_female, :senior_male, :senior_female, :photo)
  end
end
