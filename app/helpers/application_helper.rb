module ApplicationHelper
  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      case language.to_s
      when 'rb'
        lang = 'ruby'
      when 'yml'
        lang = 'yaml'
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
end
