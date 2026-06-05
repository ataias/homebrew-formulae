class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.690+c5a61e899"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.690+c5a61e899.tar.xz"
      sha256 "5f27f1ad379760f8ab0946f8f4a2c4ea03b5343313f03eef5b3c984853065703"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.690+c5a61e899.tar.xz"
      sha256 "b95fdaa14d2af28a3cdcc45a74cbd82df46d1782b99b2aec541fd32576e35055"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.690+c5a61e899.tar.xz"
      sha256 "ed11ee1c4d740a3f4205c1de1d47f932a3794c626e684bb4d355d6644b018b7b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.690+c5a61e899.tar.xz"
      sha256 "14744d5834b9c903b6a869afbe08c478ea61a01414b4d3c4a966c2b1fcdc28b7"
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
