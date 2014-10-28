class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)

    @feedback.save
    redirect_to @feedback.url, notice: "Thank you for your feedback."
  end

  private
  # Only allow a trusted parameter "white list" through.
  def feedback_params
    params.require(:feedback).permit(:url, :name, :email, :content)
  end
end
