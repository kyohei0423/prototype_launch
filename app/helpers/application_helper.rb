module ApplicationHelper
  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      case language.to_s
      when 'rb'
        lang = 'ruby'
      when 'yml'
        lang = 'yaml'
      when 'c'
        lang = 'c'
      when 'c++' 'cpp'
        lang = 'cpp'
      when 'css'
        lang = 'css'
      when 'diff'
        lang = 'diff'
      when 'erb' 'rhtml' 'eruby'
        lang = 'erb'
      when 'haml'
        lang = 'haml'
      when 'java'
        lang = 'java'
      when 'js' 'javascript'
        lang = 'js'
      when '  json'
        lang = '  json'
      when 'php'
        lang = 'php'
      when 'python'
        lang = 'python'
      when 'sql'
        lang = 'sql'
      when 'sql'
        lang = 'sql'
      when 'sql'
        lang = 'sql'
      when 'sql'
        lang = 'sql'
      when 'bash'
        lang = 'bash'
      when ''
          lang = 'plain'
      else
        lang = language
      end

      CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
    }
    markdown    = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end

  def fetch_created_date_of(content)
    content.created_at.strftime('%Y年%m月%d日 %H時%M分')
  end

  def sign_in_user_access_user_is_same(sign_in_user, access_user)
    sign_in_user.id == access_user.id
  end

  def destroy_link_to(path, object)
    link_to path,
      data: {
        confirm: "本当に<strong>#{object.title}</strong>を削除してもよろしいですか?",
        commit: '削除',
        cancel: 'やめる',
        title: '削除の確認' },
      method: :delete do
      content_tag(:i, "", class: 'fa fa-trash')
    end
  end

  def confirm_exists?(object)
    object.class.exists?(id: object.id)
  end

  def measure_of_difficulty(target)
    if target >= 9
      "Advanced !!"
    elsif target >= 7
      "Intermediate !"
    elsif target == 0
      "Measurement impossible..."
    elsif target <= 2
      "Basic !"
    elsif target <= 4
      "Fundamental !"
      "Error"
    end
  end
end
