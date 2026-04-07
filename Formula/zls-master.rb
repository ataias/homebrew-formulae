class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.16.0-dev.297+42800187"
  license "MIT"
  revision 1
  # zls_commit: 4280018713
  # zig_version: 0.16.0-dev.3128+ad7a02822

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "273575fb3706e8a17e318f3e90cc12ee89ea80f993750f58e6f1e368647799cb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "ce694db65f2a67f4d1691f53b5d61293e68b88ec4910fbc48d8db470483bc9a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "3ebb683b4d346bc656cd8f9656eb4d53628ee7f840fb967e526cc50f29cba958"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "75198a981d31e0905e3ee312df6f22ef6719ece361fb1f1d3fb7f98f3f75361e"
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
