class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.12+dc282df1"
  license "MIT"
  # zls_commit: dc282df1cc
  # zig_version: 0.17.0-dev.135+9df02121d

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "3dc95accaa93be34985d36ca070f6f245cf67f3a4834656d728d290367f12d12"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "635f544ca9a2f8f93bda32d8c0ec72ece647418c3b53f4928f03ed4e117cc6d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "91606b8e140a312a812737de837c7105efef9070f9eb5e65d1647a43561ff2dd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "a18adb24f652bf5ca96220c702af0a9196aa6937e8382cc64603c0ed762c8aaf"
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
