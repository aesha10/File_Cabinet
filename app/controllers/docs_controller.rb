class DocsController < ApplicationController

    before_action :find_doc, only: [:show, :edit, :update, :destroy]

    def index
        @docs=Doc.all.order("created_at DESC")
    end

    def show
    end

    def new # responsible for view file
        #@doc=Doc.new # before associations
        @doc = current_user.docs.build
    end

    def create # does not have view itself
        #@doc=Doc.new(doc_params) # before associations
        @doc = current_user.docs.build(doc_params)

        if @doc.save
            redirect_to @doc
        else
            render "new"
        end

    end

    def edit # responsible for view file
    end

    def update # does not have view itself
        if @doc.update(doc_params)
            redirect_to @doc
        else
            render "edit"
        end
    end

    def destroy
        @doc.destroy
        redirect_to docs_path
    end

    private
        def find_doc
            @doc=Doc.find(params[:id])
        end

        def doc_params
            params.require(:doc).permit(:title, :content)
        end
end
