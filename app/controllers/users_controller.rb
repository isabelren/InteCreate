class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy, :friends]

  def browse
    target = rand(1..User.count)
    ary = Array.new
    bool = false

    while bool == false && not(ary.size() == User.count)
      @user = User.find(target)
      if not(@user.nil?) and not(current_user.friends.exists?(@user.id)) and not(@user.id==current_user.id)
         bool = true
      else
        ary << target
        target = rand(1..User.count)
        @user = nil
      end
    end

    if @user.nil?
      redirect_to '/badbrowse'
    else
      render :show
    end

  end

  def badbrowse
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

    if (current_user.friends.exists?(@user) && @user.friends.exists?(current_user))
      render :show
    elsif (not(@user.id == current_user.id)) 
      redirect_to root_path
    end
  end

  def edit
  end

  #PATCH/PUT /users/1
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

   # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color] = "valid"
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
      redirect_to '/signup'
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :statement, 
      :image1, :image2, :image3, :image4, :image5, :friendships, :friends, :potential_id)
  end

end
