# encoding: utf-8
require 'kramdown'
require 'cgi'

def encode(url)
    return url.gsub(".md", ".html")
end

def get_file_path(date, title, base_name = nil)
    yyyy_mm_dd = "#{date[0..3]}-#{date[4..5]}-#{date[6..7]}"
    if base_name != nil
        file_name = "../_posts/" + base_name.sub(date, yyyy_mm_dd)
    else
        file_name = "../_posts/" + "#{yyyy_mm_dd}-#{title}.md"
    end
    return File.expand_path(file_name, __dir__)
end

def get_front_matters(date, title, tags = "")
    yyyy_mm_dd = "#{date[0..3]}-#{date[4..5]}-#{date[6..7]}"
    front_matters = "---\n"
    front_matters = front_matters + "layout: post\n"
    front_matters = front_matters + "title: \"#{title}\"\n"
    front_matters = front_matters + "date: #{yyyy_mm_dd} #{date[8..9]}:#{date[10..11]}:00 +0900\n"
    front_matters = front_matters + "author: poksion\n"
    front_matters = front_matters + "categories: blog\n"
    front_matters = front_matters + "tags: #{tags}\n"
    front_matters = front_matters + "---\n"
    return front_matters
end

def convert
    Dir[File.expand_path("mdblog/blog/*.md", File.expand_path("../../", __dir__))].each do | file |
        base_name = File.basename(file)
        date = base_name.split("-")[0]
        
        contents = File.read(file)

        # reg exp for front matters
        reg_exp_title =  /^.*\n.*={2,}=\n/
        reg_exp_tag = /Tag\n.*={2,}=\n.*,/
        title = reg_exp_title.match(contents)[0].sub(/\n.*={2,}=\n/, '').sub("\\#", "#") .gsub("\"", "\\\"")
        tags = reg_exp_tag.match(contents)[0].sub(/Tag\n.*={2,}=\n/, '').split(",").join(" ")

        front_matters = get_front_matters(date, title, tags)

        # reg exp for link, yyyymmddhhmm
        reg_exp_md_date = /(\d\d\d\d)(\d\d)(\d\d)\d\d\d\d-(.*?.md)/

        refined_content = contents.sub(reg_exp_title, '').sub(reg_exp_tag, '').gsub("_img/", "/assets/img/post/")
        refined_content = refined_content.gsub(reg_exp_md_date){ "/blog/#{$1}/#{$2}/#{$3}/" + encode($4) }
        refined_content = refined_content.gsub("<pre>panel-start</pre>", "<div class=\"panel\">");
        refined_content = refined_content.gsub("<pre>panel-end</pre>", "</div>");
        refined_content = refined_content.gsub("<pre>panel-hide-start</pre>", "\n<!--");
        refined_content = refined_content.gsub("<pre>panel-hide-end</pre>", "-->\n");
        refined_content = front_matters + refined_content

        File.open(get_file_path(date, title, base_name), "w:UTF-8") do |f|
            f.write refined_content
        end
    end
end

if __FILE__ == $0
    # converting completed. do nothing
    # convert
end