module Filterable
  extend ActiveSupport::Concern

  protected

  def filterable_params(klass)
    return [] unless klass.respond_to?(:permitted_search_params)

    params.permit(klass.permitted_search_params)
  end

  def filterable_scope(klass, filter)
    return nil unless klass.respond_to?(:search_param_scope) 

    klass.search_param_scope(filter)
  end
end
