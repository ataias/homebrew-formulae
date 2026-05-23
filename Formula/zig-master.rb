class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.329+21b7ceb5e"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.329+21b7ceb5e.tar.xz"
      sha256 "fe473aef6060246d19b7f559a0bcb2164e975b76029367fd917b6bfda12baf43"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.329+21b7ceb5e.tar.xz"
      sha256 "00d02a325fef53cb2a648dcec9efcbf83836f2cd21fd6697d8c8595113e7a03b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.329+21b7ceb5e.tar.xz"
      sha256 "04f808f498827c147ed4fb97fe99d0be8b71bdb0c4071288e3359e5da39d4056"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.329+21b7ceb5e.tar.xz"
      sha256 "42895dc4ae376220da34e647a7f73b04f55baecebe20f292e77ccc2c5a2008f7"
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
