# encoding: utf-8
require 'kramdown'

def convert
    Dir[File.expand_path("mdblog/blog/*.md", File.expand_path("../../", __dir__))].each do | file |
        base_name = File.basename(file)
        date = base_name.split("-")[0]
        yyyy_mm_dd = "#{date[0..3]}-#{date[4..5]}-#{date[6..7]}"
        
        contents = File.read(file)
        reg_exp_title =  /^.*\n.*={2,}=\n/
        reg_exp_tag = /Tag\n.*={2,}=\n.*,/

        title = reg_exp_title.match(contents)[0].sub(/\n.*={2,}=\n/, '').sub("\\#", "#") .gsub("\"", "\\\"")
        tags = reg_exp_tag.match(contents)[0].sub(/Tag\n.*={2,}=\n/, '').split(",").join(" ")

        front_matters = "---\n"
        front_matters = front_matters + "layout: post\n"
        front_matters = front_matters + "title: \"#{title}\"\n"
        front_matters = front_matters + "date: #{yyyy_mm_dd} #{date[8..9]}:#{date[10..11]}:00 +0900\n"
        front_matters = front_matters + "categories: blog\n"
        front_matters = front_matters + "tags: #{tags}\n"
        front_matters = front_matters + "---\n"

        # yyyymmddhhmm
        reg_exp_md_date = /(\d\d\d\d)(\d\d)(\d\d)\d\d\d\d-/

        refined_content = contents.sub(reg_exp_title, '').sub(reg_exp_tag, '').gsub("_img/", "/assets/img/post/")
        refined_content = refined_content.gsub(reg_exp_md_date, "/blog/\\1/\\2/\\3/").gsub(".md)", ".html)")
        refined_content = refined_content.gsub("<pre>panel-start</pre>", "<div class=\"panel\">");
        refined_content = refined_content.gsub("<pre>panel-end</pre>", "</div>");
        refined_content = refined_content.gsub("<pre>panel-hide-start</pre>", "\n<!--");
        refined_content = refined_content.gsub("<pre>panel-hide-end</pre>", "-->\n");

        refined_content = front_matters + refined_content
        refined_file_name = "../_posts/" + base_name.sub(date, yyyy_mm_dd)

        path = File.expand_path(refined_file_name, __dir__)
        File.open(path, "w:UTF-8") do |f|
            f.write refined_content
        end
    end
end
  
convert