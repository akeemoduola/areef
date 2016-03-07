class ListsController < ApplicationController
  def index
    @lists = List.latest
  end

  def show
    @list = List.find(lists_params["id"])
  end

  def update
    @list = List.find(lists_params["id"])
    @list.title = lists_params["title"]
    @list.body = lists_params["body"]
    @list.done = lists_params["done"]
    @list.save
    redirect_to "/lists"
  end

  def new
  end

  def edit
    @list = List.find(lists_params["id"])
  end

  def destroy
    List.delete(lists_params["id"])
    redirect_to "/lists"
  end

  def create
    @list = List.new
    @list.title = lists_params["title"]
    @list.body = lists_params["body"]
    @list.created_at = Time.now.to_s
    @list.done = "false"
    @list.save
    redirect_to "/lists"
  end

  private

  def lists_params
    params
  end
end
