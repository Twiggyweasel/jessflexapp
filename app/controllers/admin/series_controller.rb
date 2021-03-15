module Admin
  class SeriesController < ApplicationController
    before_action :set_exercise, only: %i[index]
    def index
      @series = if params[:all]
                  Series.all
                else
                  @exercise.series
                end
      respond_to do |format|
        format.html { render :index }
        format.json { @series.to_json }
      end
    end

    private

    def set_exercise
      @exercise = Exercise.find(params[:exercise_id])
    end
  end
end
