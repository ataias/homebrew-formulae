class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3146+0606af509"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3146+0606af509.tar.xz"
      sha256 "17c9a3a5c06e9aa6197268bf115177962bd0bb1e51db47fda3e3624078e8ae00"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3146+0606af509.tar.xz"
      sha256 "1d886add42df5bbeab91ba9652f298ff1a81059ba2825008ab1ec841856fce61"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3146+0606af509.tar.xz"
      sha256 "1c83b750ac80f397b6d17372ae63246d88faa80a725dced7a6ec54c26ad67a16"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3146+0606af509.tar.xz"
      sha256 "c906c866e7ad9381d112cea90c667437500904d29202d0b11ac93e1bdadc9746"
    end
  end

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install Dir["lib/*"]
  end

  test do
    system bin/"zig", "init"
    system bin/"zig", "build", "--summary", "all"
    system bin/"zig", "build", "run"
    system bin/"zig", "build", "test", "--summary", "all"
  end
end
