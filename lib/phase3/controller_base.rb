require_relative '../phase2/controller_base'
require 'active_support'
require 'active_support/core_ext'
require 'erb'
require 'active_support/inflector'
require 'byebug'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      raw_content = File.read("views/#{self.class.to_s.underscore}/#{template_name.to_s}.html.erb")
      final_content = ERB.new(raw_content).result(binding)
      render_content(final_content, "text/html")
    end
  end
end
