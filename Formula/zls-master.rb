class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.300+f391142c"
  license "MIT"
  revision 2
  # zls_commit: f391142ce2
  # zig_version: 0.16.0-dev.3144+ac6fb0b59

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "62d72150149f6fd5789d31906892f9d62e03bf85b754ae56dba7112b1be37405"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "98fbe03da521d2601cf11ae183aa7dc88bb4563ebde0e8a295a239c88e39ed62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "9b010aa0f0d3e822a23272929903852682b682dea163a8cbdb789d38828f2c3b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "27794425caaf4f6099a8045e93d66925d0c5bd090b1c7f5b858930b91a23865a"
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
