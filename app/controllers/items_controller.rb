class ItemsController < ApplicationController
  before_action :find_channel
  before_action :build_query, only: :index

  # GET /items
  # GET /items.json
  def index
    @items = @channel.items
    @items = @query.search(@items)
    @items = @items.order_by_published_at_desc
    @items = @items.page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  def download
    @item = Item.find(params[:id])
    redirect_to @item.content.url
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = @channel.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to channel_item_path(@channel, @item), notice: "Item was successfully created." }
        format.json { render json: @item, status: :created, location: channel_item_path(@channel, @item) }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(item_params)
        format.html { redirect_to channel_item_path(@channel, @item), notice: "Item was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to channel_items_url }
      format.json { head :no_content }
    end
  end

  def file
    @item = Item.find(params[:item_id])

    if stale?(@item)
      redirect_to @item.content.url, status:302
    end
  end

  private
  def find_channel
    @channel = Channel.where(id: params[:channel_id]).first
  end

  def build_query
    @query = ItemQuery.new(params[:item_query])
  end

  def item_params
    params.require(:item).permit(:title, :description, :content, :content_filename, :published_at)
  end
end
