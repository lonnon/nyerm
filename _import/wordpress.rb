require 'rubygems'
require 'sequel'
require 'fileutils'

# NOTE: This converter requires Sequel and the MySQL gems.
# The MySQL gem can be difficult to install on OS X. Once you have MySQL
# installed, running the following commands should work:
# $ sudo gem install sequel
# $ sudo gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config

module Jekyll
  module WordPress

    # Reads a MySQL database via Sequel and creates a post file for each
    # post in wp_posts that has post_status = 'publish'.
    # This restriction is made because 'draft' posts are not guaranteed
    # to have valid dates.
    QUERY = "select post_title, post_name, post_date, post_content, ID, guid from wp_posts where post_status = 'publish' and post_type = 'post'"

    def self.process(dbname, user, pass, host = 'localhost', format = 'markdown')
      db = Sequel.mysql(dbname, :user => user, :password => pass, :host => host)

      FileUtils.mkdir_p "_posts"

      db[:wp_posts].where(:post_status => 'publish',
                          :post_type => 'post').each do |post|
        # Get required fields and construct Jekyll compatible name
        title = post[:post_title]
        slug = post[:post_name]
        date = post[:post_date]
        content = post[:post_content]
        excerpt = post[:post_excerpt]
        name = "%02d-%02d-%02d-%s.#{format}" % [date.year, date.month,
                                                date.day, slug]
        
        tags = db[:wp_terms].join(:wp_term_taxonomy, :term_id => :term_id).join(:wp_term_relationships, :term_taxonomy_id => :term_taxonomy_id).where(:object_id => post[:ID], :taxonomy => 'post_tag').map(:name).join(' ').split
        
        # Get the relevant fields as a hash, delete empty fields and
        # convert to YAML for the header
        data = {
           'layout' => 'post',
           'title' => title.to_s,
           'tags' => tags,
           'excerpt' => excerpt,
           'wordpress_id' => post[:ID],
           'wordpress_url' => post[:guid]
        }.delete_if { |k,v| v.nil? ||
                            v == '' ||
                            v =~ /\A[[:space:]]+\z/}.to_yaml

        # Write out the data and content to file
        File.open("_posts/#{name}", "w") do |f|
          f.puts data
          f.puts "---"
          f.puts content
        end
      end

    end
  end
end
