class Proc
  def self.compose(f, g)
    lambda { |*args| f[g[*args]] }
  end

  def *(g)
    Proc.compose(self, g)
  end

  def extract_required_parameters
    Hash[self.parameters][:req]
  end
end
