class MicropostsController < ApplicationController
  before_action :logged_in?, only: %i(create destroy)
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build micropost_params
    @micropost.image.attach params[:micropost][:image]
    if @micropost.save
      create_post_success
    else
      @feed_items = current_user.feed.page(params[:page]).per Settings.n10
      render "static_pages/home"
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t "microposts.deleted"
    else
      flash[:danger] = t "microposts.deleted_failed"
    end
    redirect_to request.referer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :image)
  end

  def correct_user
    @micropost = current_user.microposts.find_by id: params[:id]
    redirect_to root_url if @micropost.nil?
  end

  def create_post_success
    flash[:success] = t "microposts.created"
    redirect_to root_url
  end
end
