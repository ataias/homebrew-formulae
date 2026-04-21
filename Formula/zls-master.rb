class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.5+a786b027"
  license "MIT"
  # zls_commit: a786b027fc
  # zig_version: 0.17.0-dev.44+0177cb57c

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "7818ddbd61cc89316320a4194a2bb163db77f4646e043a800fa4b919becd795d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "afa83cab277c11271d8f2a566d9a2222d02646110a8ad968b29bc64fbc0a458a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "cc96d424ab37cc22a08cff863f5a385d61f4cbcdd19a692e0ad480a15753efb2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "a076316e56ba045586731c1eaf0e56843ff226336cf7b2511fc9c332f5b925c2"
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
