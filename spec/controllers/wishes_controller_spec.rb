require 'spec_helper'

describe WishesController do
  describe "create" do
    before(:each) do
      @valid_params = {wish: {title: "A Title"}}
    end
    it "creates a new wish" do
      expect { post :create, @valid_params }.to change{Wish.count}.by 1
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
    it "gets everything" do
      get :index
      assigns(:wishes).should == Wish.all
    end
  end

end
