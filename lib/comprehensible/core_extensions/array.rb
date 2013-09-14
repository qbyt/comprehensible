class Array
  extend Comprehensible

  def self_zip
    head, *tail = self.sort_by(&:length)
    head.zip(*tail)
  end
end
