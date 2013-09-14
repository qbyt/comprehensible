module Comprehensible
  def comprehension(labeled_enums, filters=[], mappers=[])
    filters = construct_filters(filters)
    mappers = construct_mappers(mappers)

    filtered = labeled_enums.reduce({}) do |accum, (key, values)|
      values.each do |val|
        inc = filters[key].map { |filter| filter[val] }.all?

        (accum[key] ||= []) << val if inc
      end
      accum
    end

    mapped = filtered.reduce({}) do |accum, (key, values)|
      mappers[key] ? accum[key] = values.map { |value| mappers[key][value] } : accum[key] = values
      accum
    end

    self.new(mapped.keys.count >= 2 ? mapped.values.self_zip : mapped.values.flatten)
  end

  private

  def construct_mappers(mappers)
    grouped_mappers = mappers.group_by(&:extract_required_parameters)

    composed_mappers = grouped_mappers.reduce({}) do |accum, (key, values)|
      accum[key] = values.reduce(:*)
      accum
    end

    composed_mappers
  end

  def construct_filters(filters)
    grouped_filters = filters.group_by(&:extract_required_parameters)
    grouped_filters.default = []

    grouped_filters
  end
end
