class LlmPrices < Formula
  desc "Zero-dependency Python CLI for comparing LLM API costs across 277 models, 47 providers"
  homepage "https://benbencodes.github.io/llm-prices/"
  url "https://github.com/benbencodes/llm-prices/archive/refs/tags/v0.1.44.tar.gz"
  sha256 "22e3639f33718675d7efbe4fb4ce3cad023ed4f34705e57af693c1382cdd6c67"
  license "MIT"

  depends_on "python@3.11"

  def install
    system "pip3", "install", *std_pip_args, "."
  end

  test do
    assert_match "llm-prices", shell_output("#{bin}/llm-prices --version")
  end
end
