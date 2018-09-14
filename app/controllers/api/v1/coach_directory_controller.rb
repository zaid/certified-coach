class Api::V1::CoachDirectoryController < ApplicationController
  include Filterable

  def index
    @coaches = Coach.where(nil)

    filterable_params(Coach).each do |filter, value|
      @coaches = @coaches.public_send(filterable_scope(Coach, filter), value)
    end

    render json: { coaches: @coaches }
  end
end
