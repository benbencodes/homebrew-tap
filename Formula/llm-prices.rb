class LlmPrices < Formula
  desc "Zero-dependency CLI for comparing LLM API pricing across providers"
  homepage "https://benbencodes.github.io/llm-prices/"
  url "https://github.com/benbencodes/llm-prices/archive/refs/tags/v0.1.28.tar.gz"
  sha256 "38282df86c07003a03c3620fec9b3f493f7ecb28bdcfa7a41fda73cf7ce7e868"
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
