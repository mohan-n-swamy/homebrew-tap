class TuriyaSkills < Formula
  desc "Claude Code skills, hooks and a gated build workflow from the book Same Starting Line"
  homepage "https://github.com/mohan-n-swamy/turiya-companion-kit"
  url "https://github.com/mohan-n-swamy/turiya-companion-kit/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "b021c49bdbac11d6ecac6741828bc2da2e18967ab4100371223279e0a0f83ad5"
  license "MIT"

  depends_on "jq"
  depends_on "mohan-n-swamy/tap/rigor"

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

      Copy the 32 skills into ~/.claude/skills (existing ones are never overwritten):
        turiya-skills

      Also install the 9 hooks into ~/.claude/hooks and print the settings.json
      wiring (it never edits settings.json for you):
        turiya-skills --hooks

      Everything, including the manufacture workflow in ~/.claude/workflows
      (the full build pipeline: plan -> QA -> assemble -> QA -> gate):
        turiya-skills --harness

      rigor was installed as a dependency; wire it once with:
        rigor install

      Optional: route delegated work to other model families with
        brew install mohan-n-swamy/tap/mcp-brain-router

      Then start a new Claude Code session to pick them up.
    EOS
  end

  test do
    assert_predicate libexec/"skills/core", :directory?
    assert_predicate libexec/"hooks", :directory?
    assert_predicate bin/"turiya-skills", :executable?
    assert_equal 32, (libexec/"skills/core").children.count(&:directory?)
    assert_equal 9, Dir[libexec/"hooks/*.sh"].count
    assert_predicate libexec/"workflows/manufacture.js", :exist?
    ENV["HOME"] = testpath
    system bin/"turiya-skills", "--harness"
    assert_equal 32, (testpath/".claude/skills").children.count(&:directory?)
    assert_predicate testpath/".claude/workflows/manufacture.js", :exist?
    refute_predicate testpath/".claude/settings.json", :exist?
  end
end
