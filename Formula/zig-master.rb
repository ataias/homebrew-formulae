class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1442+972627084"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1442+972627084.tar.xz"
      sha256 "8cf1eaa1e1195e5e1b19e7712fed14f0060fc1c1fa5ce519fa1de732b0278a89"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1442+972627084.tar.xz"
      sha256 "2fae801b28a2cadd591a8c3e7a91f2d34040d5da07a0de4ddc69c2540662a044"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1442+972627084.tar.xz"
      sha256 "a2d94bd058e1956607ba568f9eb14019a67e7647bf1d8538ceb6417b97159268"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1442+972627084.tar.xz"
      sha256 "5a07068ced0f5435bf35032bdc406fc9faa9215ca115aa4ad65af14f2114d081"
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
