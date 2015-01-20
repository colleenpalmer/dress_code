require 'redcarpet'
require 'pygments'
require_relative '../dress_code'

class DressCode::Renderer < Redcarpet::Render::HTML

  def block_code(code, language)
    syntax = Pygments.highlight(code, {
      lexer: language,
      options: { encoding: 'utf-8' }
    })
    inner = if language == 'html'
      "<div class='code-rendered'>#{code}</div><div class='code-syntax'>#{syntax}</div>"
    else
      "<div class='code-syntax'>#{syntax}</div>"
    end
      "<div class='code-rendered'>#{inner}</div>"
  end

end

