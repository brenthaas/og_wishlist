require 'spec_helper'
require 'rails_helper'

describe WishesController do
  context "when a user is signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "create" do
      before(:each) do
        @valid_params = {wish: {title: "A Title"}}
      end
      it "creates a new wish" do
        expect { post :create, @valid_params }.to change{Wish.count}.by 1
      end
      it "associates the wish with the current user" do
        post :create, @valid_params
        expect(Wish.last.user_id).to eq @user.id
      end
      it "redirects to the index page" do
        post :create, @valid_params
        expect(response).to redirect_to :wishes
      end
      context "when an error occurs" do
        before (:each) do
          expect_any_instance_of(Wish).to receive(:valid?).and_return(false)
        end
        it "render the new template" do
          post :create, @valid_params
          expect(response).to render_template :new
        end
      end
    end

    describe "new" do
      it "responds successfully" do
        get :new
        expect(response).to be_success
      end
      it "renders new template" do
        get :new
        expect(response).to render_template :new
      end
      it "assigns a new wish for the view" do
        get :new
        expect(assigns(:wish)).to be_a_new Wish
      end
    end

    describe "show" do
      let(:wish_id) { '123' }
      before(:each) do
        @wish = mock_model(Wish)
        allow(Wish).to receive_messages(find: @wish)
      end
      it "finds a wish by id" do
        get :show, id: wish_id
        expect(assigns(:wish)).to eq @wish
      end
    end

    describe "index" do
      before(:each) do
        @user_wishes = FactoryGirl.create_list(:wish, 3, user: @user)
        @other_wishes = FactoryGirl.create_list(:wish, 3)
      end
      it "gets the current users's wishes" do
        get :index
        expect(assigns(:users_wishes)).to eq @user.wishes
      end
      it "gets other users wishes" do
        get :index
        expect(assigns(:other_wishes)).to eq @other_wishes
      end
    end
  end

  context "when a user is not logged in" do
    describe "new" do
      it "redirects to the login page" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
