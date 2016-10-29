module AdminHelper
	def show_error_messages object
    return "" if object.errors.empty?

    messages = object.errors.messages.map { |key, msg| content_tag(:li, msg.first) }.join

    html = "<div id='show-error-messages'><h4>Виправте наступні помилки:</h4><ul>#{messages}</ul></div>"

    html.html_safe
  end
end	