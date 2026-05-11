class LlmPrices < Formula
  desc "Zero-dependency CLI for comparing LLM API pricing across providers"
  homepage "https://github.com/benbencodes/llm-prices"
  url "https://github.com/benbencodes/llm-prices/archive/refs/tags/v0.1.21.tar.gz"
  sha256 "146f8ab916dd86bb82b1d51502d590b772e8c52e8d91e5c4e2328812c39e3590"
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
