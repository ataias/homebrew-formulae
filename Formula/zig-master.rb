class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.338+0d4f3cc67"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.338+0d4f3cc67.tar.xz"
      sha256 "076719076e70290d568f04ea71cc32e7c2e0ab7aa158ee2aae040f3b041c0394"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.338+0d4f3cc67.tar.xz"
      sha256 "5f53109193ed5df8dc662478c63e0c446852e557728607156ba59b11c601ee96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.338+0d4f3cc67.tar.xz"
      sha256 "55afb55dfeb06aee1bb9eeab255bc71992bfbea543528b021f0762109be604c0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.338+0d4f3cc67.tar.xz"
      sha256 "67091228bc85454f4b5f53c42c86e70efe40d3a3dab9b354cc87ad15c756093a"
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
