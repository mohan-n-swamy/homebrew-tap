class TuriyaSkills < Formula
  desc "Sanitized Claude Code skills from the book Same Starting Line (Turiya Companion Kit)"
  homepage "https://github.com/mohan-n-swamy/turiya-companion-kit"
  url "https://github.com/mohan-n-swamy/turiya-companion-kit/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4b489b31d17569311ed040bc3204ef87e21d1046b9be8044559968b80b4189c5"
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

      To copy the 27 skills into your Claude Code skills directory
      (~/.claude/skills — existing skills of the same name are never overwritten):
        turiya-skills

      To also install the 6 hooks into ~/.claude/hooks and print the
      settings.json wiring (it never edits settings.json for you):
        turiya-skills --hooks

      Then start a new Claude Code session to pick them up.
    EOS
  end

  test do
    assert_predicate libexec/"skills/core", :directory?
    assert_predicate libexec/"hooks", :directory?
    assert_predicate bin/"turiya-skills", :executable?
    assert_equal 27, (libexec/"skills/core").children.count(&:directory?)
    assert_equal 6, Dir[libexec/"hooks/*.sh"].count
  end
end
