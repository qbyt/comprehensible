module Comprehensible
  class << self
    def root
      @@root ||= File.expand_path(File.dirname(__FILE__))
    end

    def require_all path
      Dir[File.join(root, path, '*.rb')].each { |f| require f }
    end

    def load_all path
      Dir[File.join(root, path, '*.rb')].each { |f| load f }
    end
  end
end

Comprehensible::require_all('comprehensible/')
Comprehensible::load_all('comprehensible/core_extensions')
