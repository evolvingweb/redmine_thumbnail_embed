require 'redmine'

class ThumbnailEmbedMacro
  def self.tb_macro(obj, args)
    raise "Usage: {{tb(url [, width])}}" unless args.length >= 1

    url = args[0]
    width = args[1] || '90%'

    width += 'px' unless width.scan(/(px|\%)$/).length >= 1

    out = "<a class='redmine-thumbnail-embed' href='#{url}'><img src='#{url}' style='max-width:#{width}; border:8px solid #eee;'></a>".html_safe

  end
end

