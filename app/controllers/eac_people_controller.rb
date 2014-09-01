class EacPeopleController < ApplicationController
  def index
    @eac_people = EacPerson.includes(:names).all
  end

  def show
    @eac_person = EacPerson.find(params[:id])
  end
end
