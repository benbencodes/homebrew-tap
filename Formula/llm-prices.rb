class LlmPrices < Formula
  desc "Zero-dependency CLI for comparing LLM API pricing across providers"
  homepage "https://benbencodes.github.io/llm-prices/"
  url "https://github.com/benbencodes/llm-prices/archive/refs/tags/v0.1.41.tar.gz"
  sha256 "883e4e22f2b2a798c98201b6ae970cc1d18f05204fb16623aeb9af5638b1f358"
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
