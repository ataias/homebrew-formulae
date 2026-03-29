class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.295+0bb4338e"
  license "MIT"
  # zls_commit: 0bb4338e15
  # zig_version: 0.16.0-dev.3013+abd131e33

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "e49b670a8ecd5f77ddf058fa1aefb3bf928a34924222e3b48f73a948c76a3b76"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "0d1975cb8368469397143ba0fe4fe643b9be7da1a0fe9e1576988471dac14d45"
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
