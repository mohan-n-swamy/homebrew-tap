class TmuxLlmDashboard < Formula
  desc "Nine-row LLM quota + usage dashboard for a tmux pane"
  homepage "https://github.com/mohan-n-swamy/tmux-llm-dashboard"
  url "https://github.com/mohan-n-swamy/tmux-llm-dashboard/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c6f26e3505059998effb5c879937ae8bab89ed6c9d2e67b1e5519de67788ecc9"
  license "MIT"

  depends_on "tmux"

  def install
    libexec.install "status.sh", "helpers"
    (bin/"tmux-llm-dashboard").write <<~EOS
      #!/bin/zsh
      exec zsh "#{libexec}/status.sh" "$@"
    EOS
  end

  def caveats
    <<~EOS
      Sanity check:  tmux-llm-dashboard --all

      tmux binding (add to ~/.tmux.conf):
        bind-key D split-window -v -l 9 "tmux-llm-dashboard --watch '\#{pane_id}' '\#{pane_current_path}'"

      Provider keys and env vars (MMS_HOSTS, MMS_TZ, ...):
        #{homepage}#install
    EOS
  end

  test do
    assert_match "usage:", shell_output("#{bin}/tmux-llm-dashboard --bogus 2>&1", 2)
  end
end
