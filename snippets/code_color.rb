require 'rubygems'
require 'syntax/convertors/html'

if ARGV.size > 0
    code= File.read(ARGV[0])
else
    code= `pbpaste`
end

convertor = Syntax::Convertors::HTML.for_syntax "ruby"
@code_html = convertor.convert( code )

puts @code_html

if ARGV.size > 0
    fn= "#{File.basename(ARGV[0], File.extname(ARGV[0]))}.html"
    rio(fn) << @code_html
else
    # put the results back on the clipboard, NB this may fail if there are shell specific characters
    system("echo \"#{@code_html}\" | pbcopy")
end
