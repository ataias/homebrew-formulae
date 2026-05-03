class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.228+ce198b7c2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.228+ce198b7c2.tar.xz"
      sha256 "519c0faac73b07b31d6af3f204c65daf20f26184450266d2f5fa727583a8062f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.228+ce198b7c2.tar.xz"
      sha256 "f86125f8560a8335e5d92e4a6b6a03d4390a18879d49986ae0417a6a7ba36abf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.228+ce198b7c2.tar.xz"
      sha256 "3bf3c9c88cc2420524c63b3a1dedcc471e3cad81ddbdbbb128fdf6acc36ce186"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.228+ce198b7c2.tar.xz"
      sha256 "cb86a34717f6227d9c6989315a493e996117323053051489394cef4edc8444d6"
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
