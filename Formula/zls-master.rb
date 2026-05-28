class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.44+8da87d4f"
  license "MIT"
  revision 1
  # zls_commit: 8da87d4f33
  # zig_version: 0.17.0-dev.389+f5a1968f6

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "17086b24148764287eb16a4815ef3e3181d33d148c30aad93c35ac918465bb7d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "495945a76e12b97832b4ba7a7be61cf23538f787c8c6d603bcb6a22eaaa27e32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "cbeaed22a4867fd03cba26ff99d53a88cc11c7883ab8b8b1560357b8e0105ae5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "8161d37084ef2daa6c7b272eba179fafb2abe33c9eb11f955422356596acf25f"
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
