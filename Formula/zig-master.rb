class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.256+04481c76c"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.256+04481c76c.tar.xz"
      sha256 "1081c58db11bd2a82119caff81d8bdf168c9e49728f269cac2acd0bb58623d17"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.256+04481c76c.tar.xz"
      sha256 "381dc097ce82d9b9ff1601f066b764e17b8c1cf2a43758698b884ea5a091a33b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.256+04481c76c.tar.xz"
      sha256 "d50630ab4d0e8628fad1864125b1f87989bfeee159b1adcc4e6916b3ae7a68a9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.256+04481c76c.tar.xz"
      sha256 "86dc1a2212fb951f7389a067e5c660893513f688ee794b4c450452e6d05dd0e1"
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
