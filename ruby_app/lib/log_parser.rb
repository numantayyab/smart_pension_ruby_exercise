class LogParser
attr_accessor :file, :views

    def initialize(file)
        @file = file
        @views = Hash.new{|hash,key| hash[key] = [] }
    end

    def parse_logs
        raise "file not found" unless File.exists?(file)
        File.foreach(file) do |line|
            next if line.chomp.nil?
            page, ip = line.split(/\s+/)            
            make_view_structure(page, ip)
        end
    end

    def make_view_structure(page, ip)
        views[page] << ip
    end

    def most_views
        views.sort_by {|k, v| v.size}.reverse.map{|a,b|
            "#{a}: #{b.size} visits"}
    end

    def uniq_views
        views.sort_by {|k, v| v.uniq.size}.map{|a,b|
        "#{a}: #{b.uniq.size} unique visits"}
    end

end