class WorksController < ApplicationController
  def show
  end

  def edit
  end

  def create
    @work = Work.create( work_params )
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def work_params
    params.require(:work).permit(:image)
  end
end
