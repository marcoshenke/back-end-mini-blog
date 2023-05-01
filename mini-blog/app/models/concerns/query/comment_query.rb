module CommentQuery
  extend ActiveSupport::Concern
  include BaseQuery

  included do
    extend ClassMethods
  end

  module ClassMethods
    def format_params(params)
      return {} unless params

      {
        comment_cont: params[:comment],
        post_id_eq: params[:post_id],
        user_id_eq: params[:user_id]
      }
    end

    def format_order(order = '')
      return Arel.sql(order) if order.present?

      [Arel.sql('id DESC NULLS LAST')]
    end
  end
end
