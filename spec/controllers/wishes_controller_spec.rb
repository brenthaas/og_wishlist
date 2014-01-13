require 'spec_helper'

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
        Wish.last.user_id.should == @user.id
      end
      context "when an error occurs" do
        before (:each) do
          Wish.any_instance.stub(:valid?).and_return false
        end
        it "render the new template" do
          post :create, @valid_params
          response.should render_template :new
        end
      end
    end

    describe "new" do
      it "responds successfully" do
        get :new
        response.should be_success
      end
      it "renders new template" do
        get :new
        response.should render_template :new
      end
      it "assigns a new wish for the view" do
        get :new
        assigns(:wish).should be_a_new Wish
      end
    end

    describe "show" do
      let(:wish_id) { '123' }
      before(:each) do
        @wish = mock_model(Wish)
        Wish.stub(:find).with(wish_id).and_return @wish
      end
      it "finds a wish by id" do
        get :show, id: wish_id
        assigns(:wish).should == @wish
      end
    end

    describe "index" do
      before(:each) do
        @user_wishes = FactoryGirl.create_list(:wish, 3, user: @user)
        @other_wishes = FactoryGirl.create_list(:wish, 3)
      end
      it "gets the current users's wishes" do
        get :index
        assigns(:users_wishes).should == @user.wishes
      end
      it "gets other users wishes" do
        get :index
        assigns(:other_wishes).should_not include @user.wishes
      end
    end
  end

  context "when a user is not logged in" do
    describe "new" do
      it "redirects to the login page" do
        get :new
        response.should redirect_to new_user_session_path
      end
    end
  end
end
