require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirects_to new_user_url" do
        post(:create, params: {user: { username: "pap", password: "bunnies" } })
        expect(response).to redirect_to(new_user_url)
        expect(response).to have_http_status(302)
      end
    end

    context "with invalid params" do
      it "should render new with invalid params" do
        post(:create, params: {user: { username: "pop", password: "123" } })
        expect(response).to render_template("new")
        expect(response).to have_http_status(422)
      end
    end



  end

end
