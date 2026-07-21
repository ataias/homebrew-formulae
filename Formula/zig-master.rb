class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1441+d5181a9c9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1441+d5181a9c9.tar.xz"
      sha256 "4351e5c97daa1ae4eba6cf7df4d194b5f64c6d450886134b36b148a1ead70c7d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1441+d5181a9c9.tar.xz"
      sha256 "b41f7b7ed076d84cb2f9794316f947017af26b27f5c11d5d5b735942612b4cc4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1441+d5181a9c9.tar.xz"
      sha256 "769f8cb8c14bd794510b739a7247e737ece062bf4b2b63b8b8e4154c54cc3e95"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1441+d5181a9c9.tar.xz"
      sha256 "b9d2b068e4245b3de4b1e3acb43a214e46f366a7cbc77d573edc1425a4403cdd"
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
