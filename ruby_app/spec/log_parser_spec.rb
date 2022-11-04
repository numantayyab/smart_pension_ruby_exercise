require './lib/log_parser'

log_file = Dir.pwd + '/spec/fixtures/webserver.log'

describe LogParser do
    parser = LogParser.new(log_file)
    parser.parse_logs
    context "parsing a valid log file" do 
      context "when most views are called" do
        it "sorts file on views" do
            expect(parser.most_views).to start_with('/help_page/1: 5 visits')
        end
      end
      
      context "when uniq views are called" do
        it "sorts file on unique views" do
            expect(parser.uniq_views).to start_with('/contact: 3 unique visits')
        end
      end
    end
end

describe "LogParser with no or invalid file" do
    context "when provided with invalid file" do
          it "should raise an error" do
            expect{LogParser.new(Dir.pwd + '/spec/fixtures/files/test.abc').parse_logs}.to raise_error
          end
      end
  end