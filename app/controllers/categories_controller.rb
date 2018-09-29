class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    user = current_user
    @categories = user.categories
    #@categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    redirect_to user_home_url
  end

  # GET /categories/new
  def new
    @category = Category.new

  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

     @category.user_id = current_user.id

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


##
 def simple_create
   @category = Category.new(category_params)
    @category.user_id = current_user.id

     if @category.save
      render json: '{"status": "OK"}'
     else
        render json: '{"status": "NG"}'
     end
 end

def simple_destroy

   ids = params[:category_select]

  if ids.blank? then     # checkboxがちぇっくされてなければ何もしない。あればelseへ
      #何もしない
  else
      @ids = ids
      ids.each do |val|
         category = Category.find(val)
         category.destroy

      end
  end

render json: '{"status": "OK"}'

end

def cate_d
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:user_id, :category_name, :category_color, :background)
    end
end
