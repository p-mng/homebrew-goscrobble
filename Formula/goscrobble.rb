class Goscrobble < Formula
  desc "Simple, cross-platform music scrobbler daemon"
  homepage "https://github.com/p-mng/goscrobble"
  url "https://github.com/p-mng/goscrobble/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "91c16c5737e2cea5a82b9502506409a77297b05189c3824867d458e1de213553"
  license "MIT"

  depends_on "go" => :build

  on macos_do
    depends_on "media-control"
    depends_on "terminal-notifier"
  end

  def install
    system "go", "build", *std_go_args
  end

  service do
    run [opt_bin/"goscrobble", "run"]
    log_path var/"log/goscrobble.log"
    error_log_path var/"log/goscrobble.log"
  end

  test do
    system bin/"goscrobble", "check-config"
  end
end
