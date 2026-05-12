class LlmPrices < Formula
  desc "Zero-dependency CLI for comparing LLM API pricing across providers"
  homepage "https://benbencodes.github.io/llm-prices/"
  url "https://github.com/benbencodes/llm-prices/archive/refs/tags/v0.1.29.tar.gz"
  sha256 "3a0c48cc1c98bd3393998f404e9b73a6415778f81dfc7998fa53fcd423e2ecb9"
  license "MIT"
  head "https://github.com/benbencodes/llm-prices.git", branch: "main"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "OpenAI", shell_output("\#{bin}/llm-prices list")
  end
end
