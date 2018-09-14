class Api::V1::CoachDirectoryController < ApplicationController
  def index
    @coaches = Coach.where(nil)
    @coaches = @coaches.with_country(params[:country]) if params[:country].present?
    @coaches = @coaches.with_province(params[:province]) if params[:province].present?
    @coaches = @coaches.with_postal_code(params[:postal_code]) if params[:postal_code].present?
    @coaches = @coaches.with_name(params[:name]) if params[:name].present?

    render json: { coaches: @coaches }
  end
end
