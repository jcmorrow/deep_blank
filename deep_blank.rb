def deep_blank_using_detect?(hash)
  if hash.nil?
    true
  elsif hash.respond_to?(:values)
    !hash.values.detect { |value| !deep_blank_using_detect?(value) }
  else
    false
  end
end

def deep_blank_using_all?(hash)
  if hash.respond_to?(:values)
    hash.values.all? { |value| value.nil? || deep_blank_using_all?(value) }
  else
    false
  end
end
