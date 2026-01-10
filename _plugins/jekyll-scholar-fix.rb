# Fix for jekyll-scholar compatibility with Ruby 3.2+
# File.exists? was removed in Ruby 3.2, replaced with File.exist?
# This patch adds the missing method for backward compatibility

unless File.respond_to?(:exists?)
  class File
    def self.exists?(path)
      exist?(path)
    end
  end
end
