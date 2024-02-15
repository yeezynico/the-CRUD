class CommentsController < ApplicationController
  def create
    @gossip = Gossip.find(params[:gossip_id])
    user = User.all.sample
    @comment = Comment.create(content: params[:content], gossip: @gossip, user: user)
    redirect_to gossip_path(@gossip)
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@gossip), status: :see_other
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content])
      redirect_to basic_pages_home_path
    else
      render :edit
    end
  end

end


# def edit
#   @gossip = Gossip.find(params[:id])
# end

# def update
#   @gossip = Gossip.find(params[:id])
#   if @gossip.update(post_params)
#     redirect_to basic_pages_home_path
# end
