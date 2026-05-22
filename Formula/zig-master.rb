class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.315+5b647b792"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.315+5b647b792.tar.xz"
      sha256 "8874e12bfc3e541ed74f6a5c7b223592a4d7428162567055f6109153395d30ae"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.315+5b647b792.tar.xz"
      sha256 "a8bc26077f06579b5a315597239beaf2df16a3bba5422cdfa6cfc5830fc8627c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.315+5b647b792.tar.xz"
      sha256 "394543b4bfe6e9e2cda97c2c1424c031cfa2e7bf20e8bf3b425cfb80e6c7eaa1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.315+5b647b792.tar.xz"
      sha256 "29581043bf739f894eb49d7741b563dcbcd964ad4bb2391f202de9291e2fcab4"
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
