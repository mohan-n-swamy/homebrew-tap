class Rigor < Formula
  desc "The Rigor protocol for Claude Code: six answers before the work, evidence before 'done'"
  homepage "https://github.com/mohan-n-swamy/rigor"
  url "https://github.com/mohan-n-swamy/rigor/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "248035111e548a9822d23c73af6fa15121ee9cbdbe668bfd2270989a4c7e0ffd"
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
