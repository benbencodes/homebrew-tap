class LlmPrices < Formula
  desc "Zero-dependency CLI for comparing LLM API pricing across providers"
  homepage "https://github.com/benbencodes/llm-prices"
  url "https://github.com/benbencodes/llm-prices/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "dd65a93e967ff9907b57e1ea67d7ba62a26ecce1f874628e9b5b4d4855f2a604"
  license "MIT"
  head "https://github.com/benbencodes/llm-prices.git", branch: "main"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link_scripts(buildpath)
  end

  test do
    assert_match "llm-prices", shell_output("#{bin}/llm-prices --version 2>&1 || #{bin}/llm-prices --help")
  end
end
