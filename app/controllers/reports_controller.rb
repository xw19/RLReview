class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    if @report.save
      flash[:notice] = "Reported"
    else
      flash[:alert] = "something went wrong"
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end


  private

   def report_params
     params.require(:report).permit(:reason, :reportable_id, :reportable_type)
   end

end
