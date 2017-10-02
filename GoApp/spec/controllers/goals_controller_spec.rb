require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "returns http success" do
        post(:create, params:
          { goal:
            { title: "Get Obese!", body: "not-obese", completed: false, public: true }
          })
          expect(response).to redirect_to(goals_url)
        expect(response).to have_http_status(302)
      end
    end

    context "with invalid params" do
      it "returns http unsuccess" do
        post(:create, params:
          { goal:
            { title: "Get Obese!", body: "not-obese", completed: 'false', public: true }
          })
          expect(response).to render_template("new")
        expect(response).to have_http_status(422)
      end
    end
  end
  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
