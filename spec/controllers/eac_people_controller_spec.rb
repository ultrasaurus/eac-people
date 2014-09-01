require "spec_helper"

describe EacPeopleController do

  describe "GET index" do
    it "succeeds" do
      get :index
      expect(response).to be_success
    end

    it "assigns a list of people" do
      person = FactoryGirl.create(:eac_person)
      get :index
      expect(assigns(:eac_people)).to eq([person])
    end
  end

  describe "GET show" do
    let (:person) { FactoryGirl.create(:eac_person) }

    it "succeeds" do
      get :show, id: person.id
      expect(response).to be_success
    end

    it "assigns a person" do
      get :show, id: person.id
      expect(assigns(:eac_person)).to eq(person)
    end
  end
end