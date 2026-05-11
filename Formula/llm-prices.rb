class LlmPrices < Formula
  desc "Zero-dependency CLI for comparing LLM API pricing across providers"
  homepage "https://github.com/benbencodes/llm-prices"
  url "https://github.com/benbencodes/llm-prices/archive/refs/tags/v0.1.16.tar.gz"
  sha256 "332f7e2aebb5e3a3e03842db7b1dd615191f9b597042a8633f9fd7f9f9ae57b3"
  license "MIT"
  head "https://github.com/benbencodes/llm-prices.git", branch: "main"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "OpenAI", shell_output("#{bin}/llm-prices list")
  end
end