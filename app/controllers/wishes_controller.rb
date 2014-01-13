class WishesController < ApplicationController
  before_action :authenticate_user!

  def create
    wish = current_user.wishes.build(validated_params)
    if wish.save
      redirect_to :wishes
    else
      #TODO: Add a flash error notice
      render :new
    end
  end

  def new
    @wish = Wish.new
  end

  def show
    @wish = Wish.find params[:id]
    render :show
  end

  def index
    @users_wishes = current_user.wishes
    @other_wishes = Wish.where("user_id != #{current_user.id}")
    render :index
  end


  private
    def validated_params
      params.require(:wish).permit(:title, :summary, :url, :image)
    end
end
