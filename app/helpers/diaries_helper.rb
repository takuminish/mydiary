# coding: utf-8

module DiariesHelper

  def display_date
    youbi = %w[日 月 火 水 木 金 土]
    t = Time.now
    month = "%02d" % t.month
    day = "%02d" % t.day
    return "#{t.year}.#{month}.#{day}(#{youbi[t.wday]})"
  end

  def markdown(statement)
      options = {
        fenced_code_blocks: true,
        tables: true,
        hard_wrap: true
      }
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
      return markdown.render(statement).html_safe
  end  
end
