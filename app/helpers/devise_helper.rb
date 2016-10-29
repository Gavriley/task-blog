module DeviseHelper

  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.messages.map { |key, msg| content_tag(:li, msg.first) }.join

    html = <<-HTML
    <div id="error_explanation">
      <h4>Виправте наступні помилки:</h4>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end