class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.296+ef64fa01"
  license "MIT"
  revision 3
  # zls_commit: ef64fa01d9
  # zig_version: 0.16.0-dev.3066+da78940dd

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "d7fdf6379c1533b1d432234fa34ff7dafe26a84d7ac6214acaa665c98d7739a8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "db635776e810bdcedf02f27fbb9a73efefe8209eb4ca15272e80771cdc65cdac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "f8ec3ea86f75d760446866cb7d75ce3d1d45fc6088d835dbfcdb76764e6a6d3e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "842bc123838111c8ba3c2ce59e43715f06d9bcbed2891ca3a0b2714def3be25d"
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
