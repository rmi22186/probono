module ApplicationHelper
  def control_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'control-group error'
    else
      content_tag :div, capture(&block), class: 'control-group'
    end
  end
  def comment_url_helper(comment)
    maintenance_request = comment.maintenance_request
    [maintenance_request, comment]
  end
end
