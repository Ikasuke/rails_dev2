class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]
  skip_before_action :authenticate_user!, only: [:create]

#ログインユーザーのhome画面 本日のtodoで終わっていないものをを表示させる。todoを作成できる。 チェックボックスでtodoをおわらせる
 def home
    user = current_user
    @user = user
  #Todo表示用@cate_does 準備
    to_do_items = user.to_do_items
    catedoes = Array.new()

    to_do_items.each do |to_do_item|
   ## 本日のtodoでまだ終わっていないものを表示させる
      if to_do_item.start_at.blank? then     # 日程が登録されてなければ何もしない。日程があればelseへ
          #何もしない
      else
         if to_do_item.start_at.strftime("%x") == Time.now.strftime("%x") then    #登録された日程が本日であればcatedoに格納動作に進む
            if to_do_item.complete == "まだ" then                                 #完了してないなら格納する
                catedo = [user.name, to_do_item.category.category_name , to_do_item.title, to_do_item.id, to_do_item.rank]
                catedoes.push(catedo)
            else
               #完了しているので何もしない
            end
         else
            #登録されば日程が本日でないので何もしない
         end
      end
    end
    @cate_does = catedoes   #本日のtodoが入っている

   ## Todo作成用の@to_do_itemを準備　user_idはログイン中のユーザー
to_do_item = ToDoItem.new   #空
  to_do_item.user_id = user.id    #空にログインユーザーのidを入れる
     @to_do_item = to_do_item


   ## Todo作成用の@categoresを準備
     user_categories = user.categories    #リレーショナルな関係なのでuser.categoliesでログインユーザーのカテゴリーを全て格納
     category_selects = Array.new()      # 空
     user_categories.each do |user_category|
         category_select = [user_category.category_name,user_category.id]
         category_selects.push(category_select)
     end
     @category_selects = category_selects

## 本日のtodoをチェックボックスで消す処理
   ids = params[:cate_do]  #home.htmlからcheckboxにチェックされた:cate_do[3](to_do_itemのid)がparams[:cate_do]として返ってくる

   if ids.blank? then     # checkboxがちぇっくされてなければ何もしない。あればelseへ
       #何もしない
   else
       @ids = ids
       ids.each do |val|
          edit_to_do = ToDoItem.find(val)
            edit_to_do.complete = "おわった"
            edit_to_do.save    # チェックしたtodoはcomplete=終わった にする
        end
      # Ajaxの処理
       respond_to do |format|
         format.html
         format.js
       end

   end

 end   #def home end



  #def index
  #end
  #def show
  #end
  #def new
  #end
  #def edit
  #end

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
