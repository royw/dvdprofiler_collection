require 'cgi'
require 'iconv'

class String
  my_extension("unescape_html") do
    def unescape_html
      Iconv.conv("UTF-8", 'ISO-8859-1', CGI::unescapeHTML(self))
    end
  end

  # this handles unicode characters by converting each byte to "%XX"
  # where XX is the hex value
  my_extension("escape_unicode") do
    def escape_unicode
      self.each_byte.collect{|c| c.to_i > 127 ? "%#{c.to_i.to_s(16)}" : c.chr}.join('')
    end
  end

  my_extension("strip_tags") do
    def strip_tags
      gsub(/<\/?[^>]*>/, "")
    end
  end

  my_extension("ext") do
    # Replace the file extension with +newext+.  If there is no extenson on
    # the string, append the new extension to the end.  If the new extension
    # is not given, or is the empty string, remove any existing extension.
    #
    # +ext+ is a user added method for the String class.
    def ext(newext='')
      return self.dup if ['.', '..'].include? self
      if newext != ''
        newext = (newext =~ /^\./) ? newext : ("." + newext)
      end
      dup.sub!(%r(([^/\\])\.[^./\\]*$)) { $1 + newext } || self + newext
    end
  end
end

