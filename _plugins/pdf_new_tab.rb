# Open links to PDF files in a new tab.
# jekyll-link-attributes only handles external links, so without this, local
# /assets/pdf/ links (author copies, reports, award letters) replace the page.
Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  next unless doc.output_ext == ".html"

  doc.output = doc.output.gsub(/<a\s[^>]*href="[^"]+\.pdf(?:#[^"]*)?"[^>]*>/i) do |tag|
    next tag if tag.include?("target=")

    attrs = tag.include?(" rel=") ? ' target="_blank"' : ' target="_blank" rel="noopener"'
    tag.sub(/>\z/, "#{attrs}>")
  end
end
