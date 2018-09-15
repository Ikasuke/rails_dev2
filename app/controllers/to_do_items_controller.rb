class ToDoItemsController < ApplicationController
  before_action :set_to_do_item, only: [:show, :edit, :update, :destroy]

  # GET /to_do_items
  # GET /to_do_items.json


 def sort
   user = current_user
   to_do_items = user.to_do_items
   catedoes = Array.new()

    to_do_items.each do |to_do_item|
      if to_do_item.category.category_name == params[:title] then
      #  catedo = [user.name, to_do_item.category.category_name , to_do_item.title, to_do_item.id]
      catedo = to_do_item
        catedoes.push(catedo)
      else
         #何もしない
      end   #(ifのend)
    end    #(to_do_item.each のend)
    @cate_does = catedoes   #選択したtitleのtodoが入っている

 end  #(def sortのend)


  def index
    user = current_user
    @to_do_items = user.to_do_items
     #@to_do_items = ToDoItem.all
  end

  # GET /to_do_items/1
  # GET /to_do_items/1.json
  def show
    #redirect_to user_home_url
  end

  # GET /to_do_items/new
  def new

    @to_do_item = ToDoItem.new
     user = current_user
    #Todo作成用の@categoresを準備
      user_categories = user.categories
      category_selects = Array.new()
      user_categories.each do |user_category|
          category_select = [user_category.category_name,user_category.id]
          category_selects.push(category_select)
      end
      @category_selects = category_selects

  end

  # GET /to_do_items/1/edit
  def edit
     user = current_user
    #Todo作成用の@categoresを準備
      user_categories = user.categories
      category_selects = Array.new()
      user_categories.each do |user_category|
          category_select = [user_category.category_name,user_category.id]
          category_selects.push(category_select)
      end
      @category_selects = category_selects

     rank_selects =Array.new()
       rank_selects = ["☆☆☆","★☆☆","★★☆","★★★"]
       @rank_selects = rank_selects
  end

  # POST /to_do_items
  # POST /to_do_items.json
  def create

    @to_do_item = ToDoItem.new(to_do_item_params)
    #@to_do_item.category_id = "1"
   @to_do_item.user_id = current_user.id

    respond_to do |format|
      if @to_do_item.save
        format.html { redirect_to @to_do_item, notice: 'To do item was successfully created.' }
        format.json { render :show, status: :created, location: @to_do_item }


      else
        format.html { render 'users/home' }
        format.json { render json: @to_do_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_do_items/1
  # PATCH/PUT /to_do_items/1.json
  def update
    respond_to do |format|
      if @to_do_item.update(to_do_item_params)
        format.html { redirect_to @to_do_item, notice: 'To do item was successfully updated.' }
        format.json { render :show, status: :ok, location: @to_do_item }
      else
        format.html { render :edit }
        format.json { render json: @to_do_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_do_items/1
  # DELETE /to_do_items/1.json
  def destroy
    @to_do_item.destroy
    respond_to do |format|
      format.html { redirect_to to_do_items_url, notice: 'To do item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calendar
   render layout: 'calendar_layout'
 end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do_item
      @to_do_item = ToDoItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def to_do_item_params
      params.require(:to_do_item).permit(:user_id, :category_id, :title, :start_at, :end_at, :place, :memo, :attachment, :rank, :remind, :remind_time, :complete)
    end
end
