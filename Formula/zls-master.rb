class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.295+0bb4338e"
  license "MIT"
  revision 2
  # zls_commit: 0bb4338e15
  # zig_version: 0.16.0-dev.3039+b490412cd

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "0fdae32e328b29698c714a0db29e7025ddb25d168391c02e4d8b4b9cb690dd05"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "06446b09daae1e6e948f49111d455666bf833d8383c930fc30d59cdd0ac18df9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "6a9561164d7703f73615d5fd309cc840d61c44227da0282cfa43a574710da77d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "c1b185a203b7f412452c203db21a4d72f9676ea8fb75f9326a710ba0ece91597"
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
