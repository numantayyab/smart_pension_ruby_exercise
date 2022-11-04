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
        sorted_data.map{|page,ips|
            "#{page}: #{ips.size} visits"}
    end

    def uniq_views
        sorted_data('uniq').map{|page,ips|
        "#{page}: #{ips.uniq.size} unique visits"}
    end

    private
    def sorted_data(filter='')
        views.sort_by {|k, v| filter.empty? ? v.size : v.send(filter).size}.reverse
    end

end