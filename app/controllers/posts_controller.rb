class PostsController < ApplicationController
  def create
    p = post_params
    user = User.find(p[:id])
    if (p[:body] == '')
      flash[:alert] = 'コメントが未入力です。'
    else
      if user.posts.create(body: p[:body], submitter: current_user.id)
        user.touch if current_user.role != 'teacher'
        flash[:notice] = '投稿が完了しました。'
      else
        flash[:alert] = '投稿に失敗しました。'
      end
    end
    
    redirect_to user_path(user.id)
  end
  
  protected
  def post_params
    params.require(:post).permit(:body, :id)
  end
end
