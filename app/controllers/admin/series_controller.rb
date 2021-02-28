module Admin
  class SeriesController < ApplicationController
    before_action :set_activity, only: %i[index]
    def index 
      @series = @activity.series 
      respond_to do |format|
        format.html { render :index }
        format.json { @series.to_json }
      end
    end

    private

      def set_activity
        @activity = Activity.find(params[:activity_id])
      end
  end
end