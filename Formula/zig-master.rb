class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.101+4e2147d14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.101+4e2147d14.tar.xz"
      sha256 "733d396683b183d73343c5375add47c591a47c81a3eff8beb920cff3e0c0f007"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.101+4e2147d14.tar.xz"
      sha256 "197290958cb4ac81ea2fa54ab53f82bdbe4cede1b2f73b8db6e3557ae933bb1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.101+4e2147d14.tar.xz"
      sha256 "2be9d2eee75119724c0efd919c215eda334df5156ba883be527db90f42276c6b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.101+4e2147d14.tar.xz"
      sha256 "38f9af1ff86e093038dd1cc581e50b512dbe6bcd06548bbf3df2e728ba93f920"
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
