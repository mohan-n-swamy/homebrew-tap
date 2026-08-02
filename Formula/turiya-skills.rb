class TuriyaSkills < Formula
  desc "Sanitized Claude Code skills from the book Same Starting Line (Turiya Companion Kit)"
  homepage "https://github.com/mohan-n-swamy/turiya-companion-kit"
  url "https://github.com/mohan-n-swamy/turiya-companion-kit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5213d475bbabe91bedb923a85db829d14b66e43bf5b4352d20185eb82e3e97c9"
  license "MIT"

  def install
    # The kit is a set of skill directories, not a compiled program.
    # Stage the whole repo under libexec; expose the installer as `turiya-skills`.
    libexec.install Dir["*"]
    (bin/"turiya-skills").write <<~SH
      #!/bin/sh
      exec "#{libexec}/install.sh" "$@"
    SH
  end

  def caveats
    <<~EOS
      The kit is installed under:
        #{libexec}

      To copy the skills into your Claude Code skills directory
      (~/.claude/skills — existing skills of the same name are never overwritten):
        turiya-skills

      Then start a new Claude Code session to pick them up.
    EOS
  end

  test do
    assert_predicate libexec/"skills/core", :directory?
    assert_predicate bin/"turiya-skills", :executable?
  end
end
