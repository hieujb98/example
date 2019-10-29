class StaticPagesController < ApplicationController
  def home
    return unless logged_in?

    @micropost  = current_user.microposts.build
    @feed_items = Micropost.feed(current_user.id).order_created_at.page(params[:page]).per Settings.n10
  end

  def help; end

  def contact; end

  def about; end
end
