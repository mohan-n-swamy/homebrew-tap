class TmuxLlmDashboard < Formula
  desc "Nine-row LLM quota + usage dashboard for a tmux pane"
  homepage "https://github.com/mohan-n-swamy/tmux-llm-dashboard"
  url "https://github.com/mohan-n-swamy/tmux-llm-dashboard/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f8078c7c3cda9a485050d6a7a5ae905f574c15826a67fdb051d51b659c4096c8"
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
