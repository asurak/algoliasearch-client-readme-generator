require 'redcarpet'

module TableHelpers
  def params_table &block
    erbout = block.binding.eval('_erbout')
    erbout << "<table><tbody>"
    yield
    erbout << "</tbody></table>"
  end

  def params_table_row param_name, param_meta = nil, &block
    erbout = block.binding.eval('_erbout')

    param_meta = case param_meta
    when Hash
      output = '<div class="client-readme-param-meta">'
      output << "<div><em>Type: <strong>#{param_meta[:type]}</strong></em></div>" if param_meta[:type]
      output << "<div><em>Default: <strong>#{param_meta[:default]}</strong></em></div>" if param_meta[:default]
      output << '</div>'
      output
    when String
      "<div class='client-readme-param-meta'><em>#{}{params_meta}</div>"
    else
      ''
    end

    erbout << """
    <tr>
      <td valign='top'>
        <div class='client-readme-param-container'>
          <div class='client-readme-param-container-inner'>
            <div class='client-readme-param-name'><code>#{param_name}</code></div>
            #{param_meta}
          </div>
        </div>
      </td>
      <td class='client-readme-param-content'>
        #{parse_markdown(with_output_buffer(&block))}
      </td>
    </tr>
    """
  end


  private

  def parse_markdown(str)
    markdown_renderer.render(str)
  end

  def markdown_renderer
    html_options = {
      with_toc_data: true
    }

    redcarpet_options = {
      # hard_wrap: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      autolink: true,
      tables: true,
      strikethrough: true,
      superscript: true,
      disable_indented_code_blocks: true,
      lax_spacing: true
    }

    @markdown_renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(html_options), redcarpet_options)
  end




  # Stolen from ActionView
  #
  def capture(*args)
    value = nil
    buffer = with_output_buffer { value = yield(*args) }
    if string = buffer.presence || value and string.is_a?(String)
      string
    end
  end

  def with_output_buffer(buf = nil, &block) #:nodoc:
    unless buf
      buf = ''
      old_buffer = block.binding.local_variable_get(:_erbout)
      block.binding.local_variable_set(:_erbout, buf)
      yield
      block.binding.local_variable_set(:_erbout, old_buffer)
      buf
    end
  end
end