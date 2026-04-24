class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.11+b9eb9c41"
  license "MIT"
  # zls_commit: b9eb9c415d
  # zig_version: 0.17.0-dev.87+9b177a7d2

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "7cf4874ce2109816b47a37c54856853ad29316186159db89c98dd2dc7421fc8a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "b526073875b4583a296fa4f0c0f51acacfd65d1f7f05a495a74e3334fa54208a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "854f6b5890dd9bd1eae338f8454bf1fc085a800aa6456097b51de084aff2eabc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "b61b7773af157da04dabd47368a8a8c87fce20c104a320182302f63e409fd58e"
    end
  end

  conflicts_with "zls", because: "both install a `zls` binary"

  def install
    bin.install "zls"
  end

  test do
    system bin/"zls", "--version"
  end
end
