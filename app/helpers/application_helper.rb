module ApplicationHelper
  def query
    params['search']['venue']
  end
end
