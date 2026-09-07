class Rigor < Formula
  desc "The Rigor protocol for Claude Code: six answers before the work, evidence before 'done'"
  homepage "https://github.com/mohan-n-swamy/rigor"
  url "https://github.com/mohan-n-swamy/rigor/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a6f8f5ec840f5616e5828b63d959f42da50d963e2996ef1d2cf189322655a160"
  license "MIT"


  def install
    libexec.install Dir["*"]
    (bin/"rigor").write <<~EOS
      #!/bin/bash
      exec bash "#{libexec}/bin/rigor" "$@"
    EOS
  end

  def caveats
    <<~EOS
      Wire the hooks into your Claude Code setup (idempotent, reversible with 'rigor uninstall'):
        rigor install
      Then restart Claude Code sessions.
    EOS
  end

  test do
    assert_match "PASS red: bare template rejected", shell_output("#{bin}/rigor self-test")
  end
end
