# Redmine Thumbnail Embed

![](https://dl.dropbox.com/u/29440342/screenshots/KDUXKUJS-2015.09.09-12-46-05.png)

![](https://dl.dropbox.com/u/29440342/screenshots/NBKWSCJM-2015.09.09-12-46-44.png)

This macro is just a shortcut for embedding an image and linking said image to its source.

`{{thumbnail(url [, width])}}` will embed the image at url into the document (wiki or issue) at size width, if specified. Width defaults to 90% and can be specified in either px or %. 

The alias`{{tb(url [, width])}}` is a shorthand for the same macro.

The link has some default styling and class "redmine-thumbnaill-embed" for easily overriding these defaults. 

