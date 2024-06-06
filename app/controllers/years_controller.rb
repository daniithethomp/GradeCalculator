class YearsController < ApplicationController
    def new
        @year = Year.new
    end

    def create
        @year = Year.new(:number => year_params[:number], :user_id => session[:user_id])
        if @year.save
            redirect_to user_path(:id => session[:user_id])
        else
            render :new
        end
    end

    def show
        @year = Year.find(params[:id])
    end

    private

    def year_params
        params.require(:year).permit(:number)
    end
end