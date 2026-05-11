class LlmPrices < Formula
  desc "Zero-dependency CLI for comparing LLM API pricing across providers"
  homepage "https://github.com/benbencodes/llm-prices"
  url "https://github.com/benbencodes/llm-prices/archive/refs/tags/v0.1.20.tar.gz"
  sha256 "613d40b80bad4acaddf0039672278ff685095325fe1c7766a68d8a9968b456b8"
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
