class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.296+ef64fa01"
  license "MIT"
  revision 4
  # zls_commit: ef64fa01d9
  # zig_version: 0.16.0-dev.3070+b22eb176b

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "8b81fac472ff15ff501ddf291373d05505ce3456cb23d51f504e03616126c18b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "db0fd46b5335643a7475feafbedbe9478b456928d49cb604cc1ca19b843ae9a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "a08b0ece5292f0b1088b77397bb1c318b0506dbe0a8c27382492c0859e343683"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "8e1e9130f5f00c8a1426a16cf8734ece0fdfe07d25399dbbce5ebb9f49bab1d9"
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
