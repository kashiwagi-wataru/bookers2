class TagsController < ApplicationController

    def create
        tag = Tag.new(tags_params)
        tag.save
        redirect_to books_path
    end

    def destroy
    end

    def new
        @tag = Tag.new
    end

    private

    def tags_params
        params.require(:tag).permit(:genre)
    end

end
