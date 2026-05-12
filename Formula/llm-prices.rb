class LlmPrices < Formula
  desc "Zero-dependency CLI for comparing LLM API pricing across providers"
  homepage "https://benbencodes.github.io/llm-prices/"
  url "https://github.com/benbencodes/llm-prices/archive/refs/tags/v0.1.31.tar.gz"
  sha256 "e5f2f4ca3ee592d96ca9e3d634a73bd2185e3f8fcf770c2a08a117dfb24713ab"
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
