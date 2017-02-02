module ApplicationHelper
  def paginate_params
    { page: request.headers["page"] || 1, per_page: request.headers["per-page"] || 10 }
  end
end
