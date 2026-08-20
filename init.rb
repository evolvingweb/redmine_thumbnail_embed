require 'redmine'

# R7: no manual require — ThumbnailEmbedMacro (lib/thumbnail_embed_macro.rb)
# autoloads when the macros below run (Zeitwerk). refs #108530.
Redmine::Plugin.register :redmine_thumbnail_embed do
  name "Embeded Thumbnail Plugin"
  author "Thomas Getgood"
  description "Embed thumbnail pictures as links in wiki and issue pages."
  version "7.0.0"
  requires_redmine version_or_higher: '7.0.0'
  
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

