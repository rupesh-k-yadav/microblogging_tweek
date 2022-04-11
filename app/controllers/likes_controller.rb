class LikesController < ApplicationController
       
    def show
       @users = User.find(Micropost.find(params[:id]).likes.map(&:user_id))
    end

    def create

        @like = current_user.likes.find_by(micropost: params[:id])
        
        if @like.nil?
            @like = current_user.likes.build(micropost_id: params[:id])
            
            if !@like.save
                flash[:notice] = @like.errors.full_messages.to_sentence
            end
            redirect_to request.referrer
        else
            @like.destroy
            redirect_to request.referrer
        end
    end

    private

    
end
