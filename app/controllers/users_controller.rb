class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def test
    #render plain: "Hello, Rails!"
   user = User.find(1)
  to_do_items = user.to_do_items
    #@categories = user.categories
    catedoes = Array.new()
  to_do_items.each do |to_do_item|
    catedo = [user.name, to_do_item.category.category_name , to_do_item.title]
     catedoes.push(catedo)
  end
     @cate_does = catedoes
    #render plain:@to_does
   #render plain:to_do_items[1].title

  #to_do_item = ToDoItem.find(4)
  #@user = to_do_item.user
  #@category = to_do_item.category
   #render plain:@user
  end


def all
  catedoes = Array.new()
  users = User.all

  users.each do |user|
    to_do_items = user.to_do_items

    to_do_items.each do |to_do_item|
      catedo = [user.name, to_do_item.category.category_name , to_do_item.title]
      catedoes.push(catedo)
    end
  end
  @cate_does = catedoes
end  #all end

 def home
    user = current_user
    @user = user
  #Todo表示用@cate_does 準備
    to_do_items = user.to_do_items
    catedoes = Array.new()

    to_do_items.each do |to_do_item|
        catedo = [user.name, to_do_item.category.category_name , to_do_item.title]
        catedoes.push(catedo)
    end
    @cate_does = catedoes
   #Todo作成用の@to_do_itemを準備　user_idはログイン中のユーザー
    to_do_item = ToDoItem.new
    to_do_item.user_id = user.id
     @to_do_item = to_do_item
   #Todo作成用の@categoresを準備
     user_categories = user.categories
     category_selects = Array.new()
     user_categories.each do |user_category|
         category_select = [user_category.category_name,user_category.id]
         category_selects.push(category_select)
     end
     @category_selects = category_selects

 end   #def home end

#ユーザーのカテゴリー情報を表示する
def category
  user = current_user
  @categories = user.categories
  @user = user
end

#administrator
def admin
   user = current_user
   @user = user
   catedoes = Array.new()
   if user.administrator == true  then
       users = User.all
           users.each do |user|
              to_do_items = user.to_do_items
              to_do_items.each do |to_do_item|
                   catedo = [user.name, to_do_item.category.category_name , to_do_item.title]
                   catedoes.push(catedo)
              end
           end
   end  #if end
    @cate_does = catedoes
end  #admin end



  # GET /users
  # GET /users.json
  def index
    @users = User.all
  #@test = 'test'
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :mail_address, :pass_word, :administrator, :state)
    end
end
