require 'redmine'

# Note: When you pass in a url plus an argument with no space after the comma the strangest thing happens:
# tb(http://example.com, 500) gives args[0] = http://example.com and args[1] = 500 as expected.
# tb(http://example.com,500) parses as args[0] = NULL and args[1] = 500">,http://example.com
# Both cases are taken into account below.
#
# Now I know that links get rendered before this plugin gets called, but this still seems like a bug.
#
# TODO: Find out why this happens and offer up a fix. 

class ThumbnailEmbedMacro
  def self.tb_macro(obj, args)
    raise "Usage: {{tb(url [, width])}}" unless args.length >= 1

    args.length > 1 and width = args[1].scan(/^(\d+)(px|\%)?">/)  or width = []
    if width.length >= 1 then
      url = args[1].scan(/(http:\/\/.*)$/)
      width = width.join('')
    else
      # This is not a good way to get the url out of the tag, but bringing in a DOM parser
      # seems like overkill
      # TODO: Find out how to tell rails not to make text into links.
      url = args[0].scan(/href="(.+)">/)
      if args.length == 1 then
        width = '90%'
      else
        width = args[1]
      end
    end

    width += 'px' unless width.scan(/(px|\%)$/).length >= 1

    out = "<a class='redmine-thumbnail-embed' href='#{url}'><img src='#{url}' style='max-width:#{width}; border:8px solid #eee;'></a>"

  end
end


