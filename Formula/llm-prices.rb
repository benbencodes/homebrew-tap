class LlmPrices < Formula
  desc "Zero-dependency CLI for comparing LLM API pricing across providers"
  homepage "https://github.com/benbencodes/llm-prices"
  url "https://github.com/benbencodes/llm-prices/archive/refs/tags/v0.1.14.tar.gz"
  sha256 "5bc42f35d9f0c49a7f61c76f61c4af89846e19cdd298a14a557db66b826f4a52"
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