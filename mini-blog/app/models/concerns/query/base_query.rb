module BaseQuery
  extend ActiveSupport::Concern

  PER_PAGE = 20

  included do
    extend ClassMethods
  end

  module ClassMethods
    def per_page(params)
      params[:per_page].to_i.positive? ? params[:per_page].to_i : PER_PAGE
    end

    def __search(params)
      query = ransack(format_params(params))
      order_by = format_order(params[:order])
      current_page = params[:current_page].to_i.positive? ? params[:current_page].to_i : params[:page].to_i

      query.result.distinct(true).order(order_by).page(current_page).per(per_page(params))
    end

    def __count(params)
      query = ransack(format_params(params))
      query.result(distinct: true).count
    end
  end
end
