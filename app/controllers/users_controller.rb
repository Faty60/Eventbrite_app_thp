class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]
 
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Votre compte est bien enregistré'
    else
      flash[:danger] = 'Oups il y a une erreur, veuillez réessayer'
      render :new
    end
  end

  def edit
    @user = user_find
  end

  def update
    @user = user_find
    if @user.update(post_params)
      redirect_to root_path, notice: 'Modifications bien enregistrée !'
    else
      flash[danger] = "Oups il y a eu une erreur, veuillez réessayer"
      render :edit
    end
  end

  def destroy
  end
private
    # Use callbacks to share common setup or constraints between actions.
   def set_user
     @user = User.find(params[:id])
   end

    # Never trust parameters from the scary internet, only allow the white list through.
   def user_params
     params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :description)
   end

  def user_find
    @user = User.find(params[:id])
  end

  def post_params
    post_params = params.permit(:first_name, :last_name, :description)
  end
end
