require "benchmark"
require "spec_helper"
require_relative "../deep_blank"

describe "deep_blank?" do
  context "when the hash is not empty" do
    it "returns false" do
      hash = { foo: :bar, bar: nil, car: nil }

      result = deep_blank_using_all?(hash)

      expect(result).to be false
    end
  end

  context "when the hash is empty" do
    it "returns false" do
      hash = { foo: nil, bar: nil }

      result = deep_blank_using_all?(hash)

      expect(result).to be true
    end
  end

  context "when the hash is nested and empty" do
    it "returns true" do
      hash = { foo: { foo: nil }, bar: nil }

      result = deep_blank_using_all?(hash)

      expect(result).to be true
    end
  end

  context "Benchmark" do
    hash = { foo: :bar, bar: nil }

    Benchmark.bm do |x|
      x.report do
        100_000.times { deep_blank_using_detect?(hash) }
      end
      x.report do
        100_000.times { deep_blank_using_all?(hash) }
      end
    end
  end
end
