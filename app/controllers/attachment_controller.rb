class AttachmentController < ApplicationController

  # before_action :authenticate_user!,:except => [:show]
  # before_action :prevent_user_forgery, :only => [:edit,:update,:delete,:destroy]

  def index
    @attachments = current_user.attachments
  end

  def show
    # not sure if i need this. Remove this from routes
  end

  def new
    @attachment = current_user.attachments.build
  end

  def create
    @attachment = current_user.attachment.build(attachment_params)

    if @attachment.save
      flash[:notice] = "Success! Attachment created"
      redirect_to @attachment
    else
      render('new')
    end
  end

  def edit
    #@attachment = Attachment.find(params[:id])
    if !@authoriy_provided
      redirect_to :controller => 'attachment',:action => 'index'
    end
  end

  def update
    #@attachment = Attachment.find(params[:id])
    if @attachment.update(attachment_params)
      flash[:notice] = "Success! Attachment updated"
      redirect_to :controller => 'attachment', :action => 'index'
    else
      render('edit')
    end
  end

  def delete
    #@post = Post.find(params[:id])
    if !@authoriy_provided
      redirect_to :controller => 'attachment',:action => 'index'
    end
  end

  def destroy
    @attachment.destroy
    flash[:notice] = "Success! Attachment destroyed"
    redirect_to :controller => 'attachment', :action => 'index'
  end

  private
  def attachment_params
    params.require(:attachment).permit(:name, buckets: [])
  end

  def prevent_user_forgery
    @attachment = Attachment.find(params[:id])
    if @attachment.user_id != current_user.id
      @authority_provided = false
      redirect_to :controller => 'application', :action => 'home'
    else
      @authority_provided = true
    end
  end

  def inc_download_count
    @attachment = Attachment.find(params[:id])
    @attachment.download_count += 1
    @attachment.save
  end

end
