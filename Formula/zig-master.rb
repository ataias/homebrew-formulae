class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.836+e357134f0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.836+e357134f0.tar.xz"
      sha256 "59c2fbde9ad536c46a675a453b6fd7094a618f29c3ccf38c7eb9411817582a1a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.836+e357134f0.tar.xz"
      sha256 "c52552e04b7f10ff5499db8962903949538ac5bd65cab36a47f8568e7324b211"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.836+e357134f0.tar.xz"
      sha256 "de3add45691bc87209cc0f3a37c27b2df8ec83372c46f32d26f1371d65442cb7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.836+e357134f0.tar.xz"
      sha256 "3c6066b51dbf8870fd972042cdfd53d9f85f17f6619d0e60a152c6df0a5149ab"
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
