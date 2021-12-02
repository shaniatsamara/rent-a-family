class FamiliesController < ApplicationController
  def index
    if params[:search].present?
      @search = params[:search][:query]
      @families = Family.where("title ILIKE ? OR ethnicity ILIKE ?", "%#{@search}%", "%#{@search}%")
    else
      @families = Family.all
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
    if @family.valid?
      @family.save
      redirect_to family_path(@family)
    else
      render 'new'
    end
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
