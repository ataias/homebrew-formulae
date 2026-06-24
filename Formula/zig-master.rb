class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.956+2dca73595"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.956+2dca73595.tar.xz"
      sha256 "7b85e126eda9c64085cbd63436055cc4e0535b743d8c753918fcc94b7e993bb8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.956+2dca73595.tar.xz"
      sha256 "b1f7b93e02eb878f48e73b6f4567fa544e83bdf91e23d043ae69fea8367d9818"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.956+2dca73595.tar.xz"
      sha256 "2c04583b83aa25ef3602cd26fb7b63a8bab787b25a1e731ae0c77528a836052e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.956+2dca73595.tar.xz"
      sha256 "11d995f47f847c3394bb8555d7d8841e686ac6ac8c521c8ce62a6616e6eb0b48"
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
