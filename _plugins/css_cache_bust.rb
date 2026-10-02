# Re-version main.css when this site's own Sass changes.
# The theme's bust_css_cache filter only digests the theme gem's _sass
# partials, so edits to _sass/_custom.scss left main.css?v= unchanged and
# returning visitors kept the stale stylesheet. Fold the site's _sass and
# assets/css/main.scss into the digest.
require "digest/md5"

module Jekyll
  module CacheBust
    alias_method :theme_bust_css_cache, :bust_css_cache

    def bust_css_cache(file_name)
      theme_busted = theme_bust_css_cache(file_name)
      source = @context.registers[:site].source
      local_files = Dir[File.join(source, "_sass", "**", "*"), File.join(source, "assets", "css", "main.scss")]
      local_content = local_files.sort.select { |f| File.file?(f) }.map { |f| File.read(f) }.join

      "#{file_name}?v=#{Digest::MD5.hexdigest(theme_busted + local_content)}"
    end
  end
end
