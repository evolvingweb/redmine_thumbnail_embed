require 'redmine'

require File.dirname(__FILE__) + '/lib/thumbnail_embed_macro.rb'

Redmine::Plugin.register :redmine_thumbnails do
  name "Embeded Thumbnail Plugin"
  author "Thomas Getgood"
  description "Embed thumbnail pictures as links in wiki and issue pages."
  version "0.1.0"
  
  Redmine::WikiFormatting::Macros.register do
    desc = "Thumbnail embedding (tb)"
    macro :tb do |obj, args|
      out = ThumbnailEmbedMacro.tb_macro(obj, args)
    end
    desc = "Long Form Thumbnnail Embedding (thumbnail)"
    macro :thumbnail do |obj, args|
      out = ThumbnailEmbedMacro.tb_macro(obj, args)
    end
  end
end

