class Goscrobble < Formula
  desc "Simple, cross-platform music scrobbler daemon"
  homepage "https://github.com/p-mng/goscrobble"
  url "https://github.com/p-mng/goscrobble/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "a1478645637296a279b599c85ec7f3f99d66af595654ee31d6c1b726a3c538b6"
  license "MIT"

  depends_on "go" => :build

  on_macos do
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
