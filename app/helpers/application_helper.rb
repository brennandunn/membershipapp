module ApplicationHelper

  def display_base_errors resource
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

end
